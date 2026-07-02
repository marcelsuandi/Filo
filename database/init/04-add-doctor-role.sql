-- =============================================================================
-- Migration: allow 'doctor' in parents.role (untuk profil dokter yang
-- menangani kelahiran). Untuk database BARU, 02-schema.sql sudah memuat enum
-- terbaru; file ini aman dijalankan ulang pada database lama.
-- =============================================================================
ALTER TABLE parents
  MODIFY role ENUM('mother','father','guardian','doctor') NOT NULL;
