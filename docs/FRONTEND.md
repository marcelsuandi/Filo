# Frontend — Filomena

Vue 3 (Composition API) + Vite + Vue Router + Pinia + Tailwind + Axios.
Mobile-first, premium cream/white/soft-gold theme. The whole experience is a
phone-width column centered on a warm backdrop.

## Design tokens (tailwind.config.js)
- Colors: `cream`, `ivory`, `sand`, `shell`, `gold{soft,DEFAULT,deep}`, `blush`, `rose`, `ink{DEFAULT,soft,muted,faint}`
- Fonts: `font-display` (Cormorant Garamond), `font-sans` (Jost), `font-script` (Parisienne)
- Signature element: gold "F" monogram in a thin ring (`ui/MonogramF.vue`), reused on splash + footer.

## Structure
```
src/
├── components/
│   ├── layout/    SplashScreen, MusicToggle, AppFooter
│   ├── sections/  Hero, BabyProfile, BirthInfo, Story, Timeline, Gallery, Wishes, Gift, Location
│   └── ui/        MonogramF, SectionHeading, SectionDivider, BaseButton, SkeletonLine, SkeletonCard, ErrorState
├── composables/   useScrollTo, useSession
├── directives/    reveal.js  (v-reveal: animation on scroll via IntersectionObserver)
├── services/      http.js (Axios instance), api.js (endpoint map)
├── stores/        baby, gallery, timeline, music, gifts, wishes, ui  (Pinia)
├── utils/         format.js (date/time/weight/length, id locale)
├── views/         HomeView (assembles sections), NotFoundView
├── App.vue        shell: splash overlay + centered column + music toggle
├── main.js        registers Pinia, Router, v-reveal
└── style.css      Tailwind layers + reveal/skeleton/reduced-motion
```

## Behaviour
- Splash overlay until "Buka Undangan" is tapped; that gesture also starts the
  background music (autoplay-safe) and logs the visit (`POST /api/visitor`).
- Each section fetches its own Pinia store with three states: skeleton while
  loading, an `ErrorState` with retry on failure, and an empty-state message.
- Scroll reveal via the `v-reveal` directive; smooth scroll via CSS +
  `useScrollTo`. All motion is disabled under `prefers-reduced-motion`.
- Wishes form posts to the API and surfaces field-level validation errors;
  submissions await moderation (status `pending`).

## Run
```bash
cd frontend
cp .env.example .env        # VITE_API_BASE_URL=/api
npm install
npm run dev                 # http://localhost:5173 (proxies /api to :3000)
npm run build               # production build -> dist/
```

## Premium features
- Auto background music on open (gesture-safe), floating music controller.
- Splash with "Buka Undangan", scroll fade-in reveals, back-to-top button.
- Gallery as a swipeable slider (scroll-snap + arrows + dots).
- Live baby-age counter (days/hours/minutes/seconds).
- Visitor + wish counters with count-up animation (`GET /api/stats`).
- Share to WhatsApp + copy link; QRIS gift cards; Google Maps embed.
- Dark mode via CSS variables (whole palette flips; persisted; respects system).
- SEO meta + Open Graph/Twitter tags; `public/og-image.png` (1200×630), title/description updated dynamically from the baby profile.
