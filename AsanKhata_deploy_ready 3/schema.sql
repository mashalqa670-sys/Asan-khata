-- RoomSync shared database schema
-- Run this in Supabase SQL Editor.
create table if not exists public.room_data (
  id bigint primary key check (id = 1),
  payload jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.room_data enable row level security;

-- This starter setup permits access to anyone who has your project URL and anon key.
-- Share the deployed app only with your six roommates. For stronger security,
-- add Supabase Auth and replace these policies with authenticated-user policies.
drop policy if exists "room members can read shared room data" on public.room_data;
create policy "room members can read shared room data"
on public.room_data for select to anon, authenticated using (true);

drop policy if exists "room members can insert shared room data" on public.room_data;
create policy "room members can insert shared room data"
on public.room_data for insert to anon, authenticated with check (id = 1);

drop policy if exists "room members can update shared room data" on public.room_data;
create policy "room members can update shared room data"
on public.room_data for update to anon, authenticated using (id = 1) with check (id = 1);

-- Enable Realtime updates for the shared room row.
alter publication supabase_realtime add table public.room_data;
