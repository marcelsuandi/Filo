<script setup>
import { computed } from 'vue';
import { useBabyStore } from '@/stores/baby.js';
import SectionHeading from '@/components/ui/SectionHeading.vue';
import SkeletonLine from '@/components/ui/SkeletonLine.vue';

const baby = useBabyStore();
const parents = computed(() => baby.familyParents);
const story = computed(() => baby.data?.description || '');
</script>

<template>
  <section id="cerita" class="px-6 py-20">
    <SectionHeading eyebrow="Cerita" title="Sepenggal Kisah" />

    <div class="mx-auto mt-10 max-w-md text-center">
      <template v-if="baby.loading">
        <div class="space-y-3">
          <SkeletonLine /><SkeletonLine width="92%" /><SkeletonLine width="80%" />
        </div>
      </template>
      <template v-else>
        <svg class="mx-auto mb-4 h-7 w-7 text-gold-soft" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
          <path d="M7 7h4v4c0 2.2-1.8 4-4 4v-2c1.1 0 2-.9 2-2H7V7zm8 0h4v4c0 2.2-1.8 4-4 4v-2c1.1 0 2-.9 2-2h-2V7z" />
        </svg>
        <p class="font-display text-xl italic leading-relaxed text-ink-soft" v-reveal>
          {{ story || 'Setiap doa yang terucap, setiap hari yang dinanti, kini berwujud dalam dirimu. Selamat datang, anakku.' }}
        </p>

        <div v-if="parents.length" class="mt-8" v-reveal="{ delay: 120 }">
          <p class="eyebrow text-[0.6rem]">Dengan cinta</p>
          <p class="mt-2 font-script text-2xl text-gold-deep">
            {{ parents.map((p) => p.nickname || p.full_name).join(' & ') }}
          </p>
        </div>
      </template>
    </div>
  </section>
</template>
