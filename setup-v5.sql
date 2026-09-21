-- Pool Calibration Log v5.0 — session workflow
-- Run once in Supabase SQL Editor.

create table if not exists public.feeder_cleaning_cycles (
  id uuid primary key,
  month text not null,
  session integer not null check (session in (1,2)),
  finalized_at timestamptz not null default now(),
  finalized_by text,
  total_feeders integer not null,
  unique(month, session)
);

alter table public.feeder_cleaning_cycles enable row level security;

drop policy if exists "anon manage feeder cycles" on public.feeder_cleaning_cycles;
create policy "anon manage feeder cycles"
on public.feeder_cleaning_cycles
for all to anon
using (true)
with check (true);

grant select, insert, update, delete
on public.feeder_cleaning_cycles
to anon;
