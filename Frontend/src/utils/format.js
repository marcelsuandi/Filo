// Display formatters (Indonesian locale).
const MONTHS = ['Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'];
const DAYS = ['Minggu','Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'];

export function formatDate(value, { withDay = true } = {}) {
  if (!value) return '';
  const d = new Date(`${value}T00:00:00`);
  if (Number.isNaN(d.getTime())) return value;
  const base = `${d.getDate()} ${MONTHS[d.getMonth()]} ${d.getFullYear()}`;
  return withDay ? `${DAYS[d.getDay()]}, ${base}` : base;
}

export function formatTime(value) {
  if (!value) return '';
  const [h, m] = String(value).split(':');
  if (h === undefined) return value;
  return `${h}.${m ?? '00'} WIB`;
}

export function formatWeight(grams) {
  if (!grams && grams !== 0) return '';
  return `${(grams / 1000).toFixed(grams % 1000 === 0 ? 0 : 1)} kg`;
}

export function formatLength(cm) {
  if (!cm && cm !== 0) return '';
  return `${cm} cm`;
}
