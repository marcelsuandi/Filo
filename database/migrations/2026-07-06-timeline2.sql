-- =============================================================================
-- Perbaikan Timeline: nomor minggu + tanggal + gambar. Aman diulang.
-- Jalankan SETELAH memastikan file gambar bernama filo_6_bulan_2.jpeg (tanpa spasi).
-- =============================================================================

UPDATE pregnancy_timeline
SET week_number = 5, event_date = '2025-11-06'
WHERE baby_id = 1 AND title = 'Garis dua pertama';

UPDATE pregnancy_timeline
SET week_number = 5, event_date = '2025-11-08'
WHERE baby_id = 1 AND title = 'USG pertama';

UPDATE pregnancy_timeline
SET week_number = 25, event_date = '2026-03-30', image_url = '/filo_6_bulan_2.jpeg'
WHERE baby_id = 1 AND title = 'Mengetahui jenis kelamin';

UPDATE pregnancy_timeline
SET week_number = 39, event_date = '2026-07-07'
WHERE baby_id = 1 AND title = 'Hari kelahiran';
