import { ref, onMounted, onUnmounted } from 'vue';

// Penghitung ganda: sebelum waktu lahir -> countdown; setelahnya -> usia.
// Memakai birth_date + birth_time, dipatok ke WIB (UTC+7) agar konsisten.
export function useBabyAge(getBirthDate, getBirthTime) {
  const age = ref({ days: 0, hours: 0, minutes: 0, seconds: 0 });
  const isFuture = ref(false);
  let timer = null;

  function tick() {
    const rawDate = getBirthDate?.();
    if (!rawDate) return;
    const rawTime = (getBirthTime && getBirthTime()) || '00:00:00';
    const birth = new Date(`${rawDate}T${rawTime}+07:00`);
    if (Number.isNaN(birth.getTime())) return;

    let diff = Date.now() - birth.getTime();
    isFuture.value = diff < 0;
    diff = Math.abs(diff);
    const days = Math.floor(diff / 86400000); diff -= days * 86400000;
    const hours = Math.floor(diff / 3600000); diff -= hours * 3600000;
    const minutes = Math.floor(diff / 60000); diff -= minutes * 60000;
    const seconds = Math.floor(diff / 1000);
    age.value = { days, hours, minutes, seconds };
  }

  onMounted(() => { tick(); timer = setInterval(tick, 1000); });
  onUnmounted(() => clearInterval(timer));
  return { age, isFuture, tick };
}
