<script setup>
import { computed } from 'vue';
import { useBabyStore } from '@/stores/baby.js';
import MonogramF from '@/components/ui/MonogramF.vue';
import BaseButton from '@/components/ui/BaseButton.vue';

const baby = useBabyStore();
const name = computed(() => baby.data?.name || 'Filomena');
defineEmits(['open']);
</script>

<template>
  <div class="fixed inset-0 z-50 flex flex-col items-center justify-center bg-cream px-8 text-center">
    <div class="pointer-events-none absolute inset-0 bg-gradient-to-b from-blush/15 via-transparent to-gold-soft/10"></div>

    <div class="relative flex flex-col items-center">
      <div class="animate-floaty"><MonogramF :size="104" /></div>

      <p class="mt-8 font-script text-2xl text-gold-deep">Pengumuman Kelahiran</p>
      <h1 class="mt-2 font-display text-5xl font-semibold text-ink-soft">{{ name }}</h1>

      <div class="mt-6 flex items-center gap-3">
        <span class="h-px w-10 bg-gradient-to-r from-transparent to-gold-soft"></span>
        <span class="text-gold text-xs">&#10022;</span>
        <span class="h-px w-10 bg-gradient-to-l from-transparent to-gold-soft"></span>
      </div>

      <p class="mt-8 max-w-xs text-sm leading-relaxed text-ink-muted">
        Kami mengundang Anda untuk berbagi kebahagiaan atas kehadiran putri kecil kami.
      </p>

      <div class="mt-8">
        <BaseButton @click="$emit('open')">Buka Undangan</BaseButton>
      </div>
    </div>
  </div>
</template>
