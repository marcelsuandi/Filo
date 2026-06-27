<script setup>
import { computed } from 'vue';
import { useBabyStore } from '@/stores/baby.js';
import MonogramF from '@/components/ui/MonogramF.vue';

const baby = useBabyStore();
const name = computed(() => baby.data?.name || 'Filomena');
const parents = computed(() => baby.parents);
const year = new Date().getFullYear();
</script>

<template>
  <footer class="bg-cream px-6 py-16 text-center">
    <div class="flex justify-center" v-reveal><MonogramF :size="72" /></div>
    <p class="mt-6 font-display text-3xl text-ink-soft">{{ name }}</p>
    <p v-if="parents.length" class="mt-2 font-script text-xl text-gold-deep">
      {{ parents.map((p) => p.nickname || p.full_name).join(' & ') }}
    </p>
    <p class="mx-auto mt-6 max-w-xs text-sm leading-relaxed text-ink-muted">
      Terima kasih atas doa dan kasih sayang yang telah Anda berikan.
    </p>
    <p class="mt-8 text-[0.65rem] uppercase tracking-[0.25em] text-ink-faint">
      &copy; {{ year }} · Dibuat dengan cinta
    </p>
  </footer>
</template>
