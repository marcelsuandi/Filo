import { ref } from 'vue';

const KEY = 'filo_theme';
const theme = ref('light');

function apply(value) {
  theme.value = value;
  const root = document.documentElement;
  root.classList.toggle('dark', value === 'dark');
  try { localStorage.setItem(KEY, value); } catch { /* ignore */ }
}

export function initTheme() {
  let pref = 'light';
  try {
    pref = localStorage.getItem(KEY)
      || (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
  } catch { /* ignore */ }
  apply(pref);
}

export function useTheme() {
  const toggle = () => apply(theme.value === 'dark' ? 'light' : 'dark');
  return { theme, toggle };
}
