<script setup>
import { computed } from 'vue';
import { useBabyStore } from '@/stores/baby.js';
import SectionHeading from '@/components/ui/SectionHeading.vue';
import SkeletonLine from '@/components/ui/SkeletonLine.vue';
 
const baby = useBabyStore();
const data = computed(() => baby.data);
const featured = computed(() => null); // hero portrait can be wired to a featured photo later
// Nama lengkap khusus ditampilkan di bagian Profil (hero & counter tetap pakai nickname dari DB).
const fullName = 'Filomena Lioranda Tambing';
</script>
 
<template>
  <section id="profil" class="px-6 py-20">
    <SectionHeading eyebrow="Profil" title="Si Kecil Kami" />
 
    <div class="mt-10" v-reveal>
      <div class="mx-auto h-44 w-44 overflow-hidden rounded-full border border-gold-soft/60 bg-sand shadow-card">
        <img
          v-if="data?.photo_url || featured"
          :src="data?.photo_url || featured"
          :alt="`Foto ${data?.name || 'bayi'}`"
          class="h-full w-full object-cover"
          loading="lazy"
        />
        <div v-else class="flex h-full w-full items-center justify-center font-script text-5xl text-gold-deep/70">
          {{ (data?.name || 'F').charAt(0) }}
        </div>
      </div>
 
      <div class="mt-8 text-center">
        <template v-if="baby.loading">
          <div class="mx-auto flex max-w-xs flex-col items-center gap-3">
            <SkeletonLine width="60%" height="1.6rem" />
            <SkeletonLine width="85%" />
            <SkeletonLine width="70%" />
          </div>
        </template>
        <template v-else>
          <h3 class="font-display text-3xl font-medium leading-tight text-ink-soft">{{ fullName }}</h3>
          <p v-if="data?.description" class="mx-auto mt-4 max-w-md text-[0.95rem] leading-relaxed text-ink-muted">
            {{ data.description }}
          </p>
        </template>
      </div>
    </div>
  </section>
</template>