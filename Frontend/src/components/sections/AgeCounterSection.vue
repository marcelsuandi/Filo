<script setup>
import { computed } from 'vue';
import { useBabyStore } from '@/stores/baby.js';
import { useBabyAge } from '@/composables/useBabyAge.js';
import SectionHeading from '@/components/ui/SectionHeading.vue';

const baby = useBabyStore();
const { age } = useBabyAge(() => baby.data?.birth_date);
const name = computed(() => baby.data?.name || 'Filomena');

const units = computed(() => [
  { label: 'Hari', value: age.value.days },
  { label: 'Jam', value: age.value.hours },
  { label: 'Menit', value: age.value.minutes },
  { label: 'Detik', value: age.value.seconds },
]);
const pad = (n) => String(n).padStart(2, '0');
</script>

<template>
  <section id="usia" class="px-6 py-20">
    <SectionHeading eyebrow="Setiap Detik Berharga" :title="`Usia ${name}`" />

    <div class="mx-auto mt-10 grid max-w-sm grid-cols-4 gap-3" v-reveal>
      <div
        v-for="u in units" :key="u.label"
        class="rounded-2xl border border-gold-soft/40 bg-ivory py-4 text-center shadow-soft"
      >
        <p class="font-display text-3xl font-medium tabular-nums text-ink-soft">
          {{ u.label === 'Hari' ? u.value : pad(u.value) }}
        </p>
        <p class="mt-1 text-[0.6rem] uppercase tracking-[0.2em] text-ink-muted">{{ u.label }}</p>
      </div>
    </div>
  </section>
</template>
