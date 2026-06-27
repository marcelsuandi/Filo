import { defineStore } from 'pinia';
import api from '@/services/api.js';

export const useWishesStore = defineStore('wishes', {
  state: () => ({
    items: [], meta: null, loading: false, error: null, _promise: null,
    submitting: false, submitError: null, fieldErrors: {}, submitted: false,
  }),
  getters: { isEmpty: (s) => !s.loading && !s.error && s.items.length === 0 },
  actions: {
    async fetch(params = {}, force = false) {
      if (this.items.length && !force) return this.items;
      if (this._promise) return this._promise;
      this.loading = true; this.error = null;
      this._promise = api.getWishes(params)
        .then(({ data }) => { this.items = data.data ?? []; this.meta = data.meta ?? null; return this.items; })
        .catch((err) => { this.error = err?.response?.data?.message || 'Gagal memuat ucapan.'; throw err; })
        .finally(() => { this.loading = false; this._promise = null; });
      return this._promise.catch(() => []);
    },
    async submit(payload) {
      this.submitting = true; this.submitError = null; this.fieldErrors = {}; this.submitted = false;
      try {
        await api.createWish(payload);
        this.submitted = true;
        return true;
      } catch (err) {
        const res = err?.response?.data;
        if (res?.errors?.length) {
          this.fieldErrors = res.errors.reduce((acc, e) => { acc[e.field] = e.message; return acc; }, {});
        }
        this.submitError = res?.message || 'Gagal mengirim ucapan. Coba lagi.';
        return false;
      } finally {
        this.submitting = false;
      }
    },
    resetSubmit() { this.submitted = false; this.submitError = null; this.fieldErrors = {}; },
  },
});
