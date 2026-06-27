/** @type {import('tailwindcss').Config} */
export default {
  darkMode: 'class',
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        // Neutral palette is driven by CSS variables so dark mode flips
        // automatically without per-element dark: classes.
        cream: 'rgb(var(--c-cream) / <alpha-value>)',
        ivory: 'rgb(var(--c-ivory) / <alpha-value>)',
        sand: 'rgb(var(--c-sand) / <alpha-value>)',
        shell: 'rgb(var(--c-shell) / <alpha-value>)',
        ink: {
          DEFAULT: 'rgb(var(--c-ink) / <alpha-value>)',
          soft: 'rgb(var(--c-ink-soft) / <alpha-value>)',
          muted: 'rgb(var(--c-ink-muted) / <alpha-value>)',
          faint: 'rgb(var(--c-ink-faint) / <alpha-value>)',
        },
        // Accents read well in both themes -> kept fixed.
        gold: { soft: '#E0C896', DEFAULT: '#C9A86A', deep: '#B08D4F' },
        blush: '#E7D3CE',
        rose: '#C9959B',
      },
      fontFamily: {
        display: ['"Cormorant Garamond"', 'Georgia', 'serif'],
        sans: ['Jost', 'ui-sans-serif', 'system-ui', 'sans-serif'],
        script: ['Parisienne', 'cursive'],
      },
      letterSpacing: { eyebrow: '0.32em' },
      maxWidth: { invite: '30rem' },
      boxShadow: {
        card: '0 18px 50px -28px rgba(0, 0, 0, 0.45)',
        soft: '0 10px 30px -20px rgba(0, 0, 0, 0.4)',
        gold: '0 14px 34px -16px rgba(176, 141, 79, 0.55)',
      },
      keyframes: {
        shimmer: { '0%': { backgroundPosition: '200% 0' }, '100%': { backgroundPosition: '-200% 0' } },
        floaty: { '0%,100%': { transform: 'translateY(0)' }, '50%': { transform: 'translateY(-12px)' } },
        nudge: { '0%,100%': { transform: 'translateY(0)', opacity: '0.6' }, '50%': { transform: 'translateY(6px)', opacity: '1' } },
        sheen: { '0%,100%': { opacity: '0.35' }, '50%': { opacity: '0.6' } },
      },
      animation: {
        shimmer: 'shimmer 1.5s ease-in-out infinite',
        floaty: 'floaty 7s ease-in-out infinite',
        nudge: 'nudge 1.8s ease-in-out infinite',
        sheen: 'sheen 6s ease-in-out infinite',
      },
    },
  },
  plugins: [],
};
