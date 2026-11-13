# Instalasi

1. Pasang Node.js 20+ dan jalankan `npm install`.
2. Salin `.env.example` menjadi `.env`.
3. Isi URL project dan publishable key dari Supabase Dashboard → Project Settings → API Keys. Jangan gunakan service_role di browser.
4. Jalankan `npm run dev`; build produksi dengan `npm run build`.
5. Untuk GitHub Pages, pilih GitHub Actions pada Settings → Pages dan buat Actions secrets `VITE_SUPABASE_URL` serta `VITE_SUPABASE_PUBLISHABLE_KEY`.

URL setelah workflow berhasil: https://webukmkomsiuinkhasjember.github.io/Komsi-Tari-Library/
