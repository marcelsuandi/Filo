-- Tambah foto Filo ke Galeri "Momen Pertama". Aman dijalankan berulang.
--   docker compose exec -T mariadb mariadb -u root -p"$DB_ROOT_PASSWORD" "$DB_NAME" < database/migrations/2026-07-08-galeri.sql

INSERT INTO gallery_photos (baby_id, image_url, caption, sort_order, is_featured, is_published)
SELECT * FROM (SELECT 1, '/filo_1.jpg', 'Filo', 2, 0, 1) AS t
WHERE NOT EXISTS (SELECT 1 FROM gallery_photos WHERE baby_id=1 AND image_url='/filo_1.jpg');

INSERT INTO gallery_photos (baby_id, image_url, caption, sort_order, is_featured, is_published)
SELECT * FROM (SELECT 1, '/filo_2.jpg', 'Filo', 3, 0, 1) AS t
WHERE NOT EXISTS (SELECT 1 FROM gallery_photos WHERE baby_id=1 AND image_url='/filo_2.jpg');

INSERT INTO gallery_photos (baby_id, image_url, caption, sort_order, is_featured, is_published)
SELECT * FROM (SELECT 1, '/filo_3.jpg', 'Filo', 4, 0, 1) AS t
WHERE NOT EXISTS (SELECT 1 FROM gallery_photos WHERE baby_id=1 AND image_url='/filo_3.jpg');

INSERT INTO gallery_photos (baby_id, image_url, caption, sort_order, is_featured, is_published)
SELECT * FROM (SELECT 1, '/filo_4.jpg', 'Filo', 5, 0, 1) AS t
WHERE NOT EXISTS (SELECT 1 FROM gallery_photos WHERE baby_id=1 AND image_url='/filo_4.jpg');
