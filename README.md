# KOMSI TARI LIBRARY

Digital Dance Archive and Learning Platform for KOMSI UIN KHAS Jember.

## Fitur
- Katalog arsip tari dengan pencarian dan filter kategori.
- Pemisahan Tutorial, Dokumentasi, dan Kostum & Properti.
- Embed YouTube dan tautan ke konten platform sosial lainnya.
- Login admin Supabase Auth serta CRUD konten.
- Statistik kunjungan halaman melalui tabel `site_view_events`.
- UI responsif untuk desktop dan perangkat seluler.

## Teknologi
React + Vite, Supabase Auth, PostgreSQL, Row Level Security, dan GitHub Actions.

## Menjalankan lokal
Lihat [docs/SETUP.md](docs/SETUP.md). Salin `.env.example` menjadi `.env`, lalu isi Supabase URL dan publishable key. Jangan pernah menaruh `service_role` key di frontend.

## Admin
Lihat [docs/ADMIN_SETUP.md](docs/ADMIN_SETUP.md). Hak admin dibaca dari trusted `app_metadata.role=admin`; RLS tetap melindungi database.

## Deploy
Workflow GitHub Actions berada di `.github/workflows/deploy.yml`. Aktifkan GitHub Pages dengan source GitHub Actions dan tambahkan repository secrets berikut di Settings → Secrets and variables → Actions:\n- `VITE_SUPABASE_URL` = URL project Supabase.\n- `VITE_SUPABASE_PUBLISHABLE_KEY` = Publishable Key Supabase (awalan `sb_publishable_`).\n\nJangan gunakan atau menyimpan `service_role`/secret key di frontend.

## Supabase
Project yang digunakan: `Komsi Tari Library` (`tluqqxrbvpggehelybnn`). Aplikasi memakai tabel yang sudah ada: `dance_categories`, `dance_library`, `profiles`, `dance_view_events`, dan `site_view_events`. Tidak membuat atau mengubah database KOMSI Musik maupun KOMSI Rupa.
