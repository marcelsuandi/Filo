<script setup>
// Signature element: gold "F" within a thin ring + small laurel marks.
defineProps({ size: { type: Number, default: 96 } });
</script>

<template>
  <svg :width="size" :height="size" viewBox="0 0 120 120" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Monogram Filomena">
    <circle cx="60" cy="60" r="54" stroke="#C9A86A" stroke-width="1" />
    <circle cx="60" cy="60" r="48" stroke="#E0C896" stroke-width="0.6" stroke-dasharray="1 4" />
    <!-- small laurel ticks -->
    <path d="M60 10 q3 5 0 10 q-3 -5 0 -10Z" fill="#C9A86A" opacity="0.8" />
    <path d="M60 110 q3 -5 0 -10 q-3 5 0 10Z" fill="#C9A86A" opacity="0.8" />
    <text x="60" y="78" text-anchor="middle" font-family="'Cormorant Garamond', serif" font-size="58" font-weight="600" fill="#B08D4F">F</text>
  </svg>
</template>
