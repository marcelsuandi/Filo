<script setup>
import { computed } from 'vue';
import { useBabyStore } from '@/stores/baby.js';
import SectionHeading from '@/components/ui/SectionHeading.vue';
import BaseButton from '@/components/ui/BaseButton.vue';

const baby = useBabyStore();

// --- Info rumah sakit (silakan sesuaikan bila perlu) -----------------------
const hospital = {
  address: 'Jl. Raya Jatimekar RT.001/RW.012, Jatimekar, Kec. Jatiasih, Kota Bekasi, Jawa Barat 17422',
  phone: '(021) 8551 1000',
};
// ---------------------------------------------------------------------------

const doctors = computed(() => baby.doctors);
const place = computed(() => baby.data?.birth_place || '');
const city = computed(() => baby.data?.birth_city || '');
// Query peta memakai alamat lengkap bila lokasi RS ini, agar pin tepat.
const query = computed(() => {
  const base = [place.value, city.value].filter(Boolean).join(', ');
  return place.value ? `${place.value}, ${hospital.address}` : base;
});
const hasLocation = computed(() => !!place.value);
const mapsEmbed = computed(() => `https://maps.google.com/maps?q=${encodeURIComponent(query.value)}&z=16&output=embed`);
const mapsLink = computed(() => `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(query.value)}`);
</script>

<template>
  <section id="lokasi" class="bg-ivory px-6 py-20">
    <SectionHeading eyebrow="Lokasi" title="Rumah Sakit" />

    <div class="mx-auto mt-10 max-w-md text-center" v-reveal>
      <template v-if="hasLocation">
        <p class="font-display text-2xl text-ink-soft">{{ place }}</p>
        <p class="mt-2 text-sm leading-relaxed text-ink-muted">{{ hospital.address }}</p>
        <p v-if="hospital.phone" class="mt-1 text-sm text-ink-muted">Telp. {{ hospital.phone }}</p>

        <div class="mt-6 overflow-hidden rounded-2xl border border-shell shadow-soft">
          <iframe
            :src="mapsEmbed"
            class="h-56 w-full"
            style="border:0"
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"
            title="Peta lokasi rumah sakit"
          ></iframe>
        </div>

        <a :href="mapsLink" target="_blank" rel="noopener" class="mt-6 inline-block">
          <BaseButton variant="outline">Buka di Google Maps</BaseButton>
        </a>
      </template>

      <p v-else class="text-sm text-ink-muted">Informasi lokasi belum tersedia.</p>

      <!-- Dokter yang menangani -->
      <div v-if="doctors.length" class="mt-10 border-t border-shell/70 pt-8" v-reveal="{ delay: 100 }">
        <p class="eyebrow text-[0.6rem]">Ditangani oleh</p>
        <div
          v-for="doc in doctors"
          :key="doc.id"
          class="mt-4 flex items-center justify-center gap-4"
        >
          <div class="h-16 w-16 shrink-0 overflow-hidden rounded-full border border-gold-soft/60 bg-sand">
            <img
              v-if="doc.photo_url"
              :src="doc.photo_url"
              :alt="doc.full_name"
              loading="lazy"
              class="h-full w-full object-cover"
            />
            <div v-else class="flex h-full w-full items-center justify-center font-script text-2xl text-gold-deep/70">
              {{ (doc.full_name || 'd').charAt(0) }}
            </div>
          </div>
          <div class="text-left">
            <p class="font-display text-lg leading-tight text-ink-soft">{{ doc.full_name }}</p>
            <p v-if="doc.nickname" class="text-xs uppercase tracking-[0.16em] text-gold-deep">{{ doc.nickname }}</p>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
