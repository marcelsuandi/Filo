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
  room: 'Ruang Anyelir, Kamar 208, Lantai 2',
  visitingHours: ['10.00 - 12.00 WIB', '17.00 - 19.00 WIB'],
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

        <!-- Info ruang perawatan & jam besuk -->
        <div class="mx-auto mt-6 max-w-xs rounded-2xl border border-gold-soft/40 bg-ivory p-5 text-center shadow-soft">
          <p class="eyebrow text-[0.6rem]">Kami berada di</p>
          <p class="mt-2 font-display text-lg text-ink-soft">{{ hospital.room }}</p>
          <div class="mt-4 border-t border-shell/70 pt-4">
            <p class="eyebrow text-[0.6rem]">Jam Besuk</p>
            <p v-for="jam in hospital.visitingHours" :key="jam" class="mt-1 text-sm text-ink-muted">{{ jam }}</p>
          </div>
        </div>

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
      <div v-if="doctors.length" class="mt-10 border-t border-shell/70 pt-10" v-reveal="{ delay: 100 }">
        <p class="eyebrow text-[0.7rem]">Dokter Kami</p>
        <div
          v-for="doc in doctors"
          :key="doc.id"
          class="mt-5 flex items-center gap-5 rounded-2xl border border-gold-soft/40 bg-cream p-5 text-left shadow-soft"
        >
          <div class="h-20 w-20 shrink-0 overflow-hidden rounded-full border border-gold-soft/60 bg-sand">
            <img
              v-if="doc.photo_url"
              :src="doc.photo_url"
              :alt="doc.full_name"
              loading="lazy"
              class="h-full w-full object-cover"
            />
            <div v-else class="flex h-full w-full items-center justify-center font-script text-3xl text-gold-deep/70">
              {{ (doc.full_name || 'd').charAt(0) }}
            </div>
          </div>
          <div class="min-w-0">
            <p class="font-display text-xl leading-tight text-ink-soft">{{ doc.full_name }}</p>
            <p v-if="doc.nickname" class="text-xs uppercase tracking-[0.16em] text-gold-deep">{{ doc.nickname }}</p>
            <p v-if="doc.bio" class="mt-1 text-sm leading-relaxed text-ink-muted">{{ doc.bio }}</p>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
