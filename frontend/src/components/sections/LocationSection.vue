<script setup>
import { computed } from 'vue';
import { useBabyStore } from '@/stores/baby.js';
import SectionHeading from '@/components/ui/SectionHeading.vue';
import BaseButton from '@/components/ui/BaseButton.vue';

const baby = useBabyStore();
const place = computed(() => baby.data?.birth_place || '');
const city = computed(() => baby.data?.birth_city || '');
const query = computed(() => [place.value, city.value].filter(Boolean).join(', '));
const mapsEmbed = computed(() => `https://maps.google.com/maps?q=${encodeURIComponent(query.value)}&z=15&output=embed`);
const mapsLink = computed(() => `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(query.value)}`);
</script>

<template>
  <section id="lokasi" class="bg-ivory px-6 py-20">
    <SectionHeading eyebrow="Lokasi" title="Rumah Sakit" />

    <div class="mx-auto mt-10 max-w-md text-center" v-reveal>
      <p v-if="place" class="font-display text-2xl text-ink-soft">{{ place }}</p>
      <p v-if="city" class="mt-1 text-sm text-ink-muted">{{ city }}</p>

      <div v-if="query" class="mt-6 overflow-hidden rounded-2xl border border-shell shadow-soft">
        <iframe
          :src="mapsEmbed"
          class="h-56 w-full"
          style="border:0"
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade"
          title="Peta lokasi rumah sakit"
        ></iframe>
      </div>

      <a v-if="query" :href="mapsLink" target="_blank" rel="noopener" class="mt-6 inline-block">
        <BaseButton variant="outline">Buka di Google Maps</BaseButton>
      </a>

      <p v-else class="text-sm text-ink-muted">Informasi lokasi belum tersedia.</p>
    </div>
  </section>
</template>
