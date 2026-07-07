-- Foto USG pertama (pastikan file /usg_pertama.jpg sudah di-push & rebuild dulu)
UPDATE pregnancy_timeline SET image_url='/usg_pertama.jpg' WHERE baby_id=1 AND title='USG pertama';

-- Approve semua ucapan yang mungkin masih pending (agar langsung tampil)
UPDATE greetings SET status='approved' WHERE baby_id=1 AND status='pending';
