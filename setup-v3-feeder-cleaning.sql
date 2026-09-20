-- Pool Calibration Log v3 — Feeder Cleaning module
-- Run once in Supabase SQL Editor AFTER the original setup.sql.

create table if not exists public.feeder_cleaning_schedules (
  month text primary key,
  session_1_start date not null,
  session_1_end date not null,
  session_2_start date not null,
  session_2_end date not null,
  updated_at timestamptz not null default now()
);

create table if not exists public.feeder_cleanings (
  id uuid primary key,
  month text not null,
  feeder_key text not null,
  property text not null,
  pool_id text not null,
  pool_name text not null,
  feeder_letter text not null,
  session integer not null check (session in (1,2)),
  feed_down_at timestamptz,
  feed_down_by text,
  cleaned_at timestamptz,
  cleaned_by text,
  note text,
  updated_at timestamptz not null default now(),
  unique(month, feeder_key)
);

create index if not exists feeder_cleanings_month_idx on public.feeder_cleanings(month);
create index if not exists feeder_cleanings_pool_idx on public.feeder_cleanings(property,pool_id);

alter table public.feeder_cleaning_schedules enable row level security;
alter table public.feeder_cleanings enable row level security;

drop policy if exists "anon manage feeder schedules" on public.feeder_cleaning_schedules;
create policy "anon manage feeder schedules" on public.feeder_cleaning_schedules
for all to anon using (true) with check (true);

drop policy if exists "anon manage feeder cleanings" on public.feeder_cleanings;
create policy "anon manage feeder cleanings" on public.feeder_cleanings
for all to anon using (true) with check (true);

grant select, insert, update, delete on public.feeder_cleaning_schedules to anon;
grant select, insert, update, delete on public.feeder_cleanings to anon;

grant delete on public.spot_checks to anon;
drop policy if exists "anon delete spot checks" on public.spot_checks;
create policy "anon delete spot checks" on public.spot_checks
for delete to anon using (true);
