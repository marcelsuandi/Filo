import { defineStore } from 'pinia';
import api from '@/services/api.js';

export const useBabyStore = defineStore('baby', {
  state: () => ({ data: null, loading: false, error: null, _promise: null }),
  getters: {
    parents: (s) => s.data?.parents ?? [],
  },
  actions: {
    async fetch(force = false) {
      if (this.data && !force) return this.data;
      if (this._promise) return this._promise;
      this.loading = true;
      this.error = null;
      this._promise = api
        .getBaby()
        .then(({ data }) => { this.data = data.data; return this.data; })
        .catch((err) => { this.error = err?.response?.data?.message || 'Gagal memuat data bayi.'; throw err; })
        .finally(() => { this.loading = false; this._promise = null; });
      return this._promise.catch(() => null);
    },
  },
});
