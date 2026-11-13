# Setup Admin

Buat user melalui Supabase Dashboard → Authentication → Users → Add user. Tetapkan trusted `app_metadata` menjadi `{ "role": "admin" }` melalui jalur Admin API tepercaya; jangan gunakan `user_metadata`. Login memakai email/password. RLS database tetap menjadi otoritas akses.
