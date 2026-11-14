insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
values ('dance-documentation','dance-documentation',false,5242880,array['image/jpeg','image/png','image/webp'])
on conflict (id) do update set public=false,file_size_limit=5242880,allowed_mime_types=array['image/jpeg','image/png','image/webp'];

create table if not exists public.dance_library_photos (
 id uuid primary key default gen_random_uuid(),
 dance_id uuid not null references public.dance_library(id) on delete cascade,
 storage_path text not null unique,
 sort_order integer not null default 0,
 created_at timestamptz not null default now()
);
create index if not exists dance_library_photos_dance_order_idx on public.dance_library_photos(dance_id,sort_order,created_at);
alter table public.dance_library_photos enable row level security;
grant select on public.dance_library_photos to anon,authenticated;
grant insert,update,delete on public.dance_library_photos to authenticated;
drop policy if exists "Published dance photos are readable" on public.dance_library_photos;
create policy "Published dance photos are readable" on public.dance_library_photos for select to anon,authenticated using (
 public.is_tari_admin() or exists(select 1 from public.dance_library d where d.id=dance_id and d.is_published=true)
);
drop policy if exists "Admins manage dance photos" on public.dance_library_photos;
create policy "Admins manage dance photos" on public.dance_library_photos for all to authenticated using(public.is_tari_admin()) with check(public.is_tari_admin());

drop policy if exists "Published dance gallery files are readable" on storage.objects;
create policy "Published dance gallery files are readable" on storage.objects for select to anon,authenticated using (
 bucket_id='dance-documentation' and (
  public.is_tari_admin() or exists(
   select 1 from public.dance_library_photos p join public.dance_library d on d.id=p.dance_id
   where p.storage_path=name and d.is_published=true
  )
 )
);
drop policy if exists "Admins upload dance gallery files" on storage.objects;
create policy "Admins upload dance gallery files" on storage.objects for insert to authenticated with check(bucket_id='dance-documentation' and public.is_tari_admin());
drop policy if exists "Admins delete dance gallery files" on storage.objects;
create policy "Admins delete dance gallery files" on storage.objects for delete to authenticated using(bucket_id='dance-documentation' and public.is_tari_admin());
