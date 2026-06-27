import { ref, onMounted, onUnmounted } from 'vue';

// Live "age since birth" ticker.
export function useBabyAge(getBirthDate) {
  const age = ref({ days: 0, hours: 0, minutes: 0, seconds: 0 });
  let timer = null;

  function tick() {
    const raw = getBirthDate();
    if (!raw) return;
    const birth = new Date(`${raw}T00:00:00`);
    if (Number.isNaN(birth.getTime())) return;
    let diff = Math.max(0, Date.now() - birth.getTime());
    const days = Math.floor(diff / 86400000); diff -= days * 86400000;
    const hours = Math.floor(diff / 3600000); diff -= hours * 3600000;
    const minutes = Math.floor(diff / 60000); diff -= minutes * 60000;
    const seconds = Math.floor(diff / 1000);
    age.value = { days, hours, minutes, seconds };
  }

  onMounted(() => { tick(); timer = setInterval(tick, 1000); });
  onUnmounted(() => clearInterval(timer));
  return { age, tick };
}
