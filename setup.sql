-- Pool Calibration Log v2: run once in Supabase > SQL Editor

create table if not exists public.spot_checks (
  id uuid primary key,
  pool_key text not null,
  property text not null,
  pool_id text not null,
  pool_name text not null,
  observed_at timestamptz not null,
  technician text,
  controller_ph numeric not null,
  test_ph numeric not null,
  controller_fc numeric not null,
  test_fc numeric not null,
  orp_mv integer not null,
  calibration_performed boolean not null default false,
  ph_calibrated boolean not null default false,
  fc_calibrated boolean not null default false,
  post_calibration_ph numeric,
  post_calibration_fc numeric,
  notes text,
  device_id text,
  created_at timestamptz not null default now()
);

create index if not exists spot_checks_pool_key_idx on public.spot_checks(pool_key);
create index if not exists spot_checks_observed_at_idx on public.spot_checks(observed_at desc);

alter table public.spot_checks enable row level security;

drop policy if exists "anon read spot checks" on public.spot_checks;
create policy "anon read spot checks" on public.spot_checks
for select to anon using (true);

drop policy if exists "anon insert spot checks" on public.spot_checks;
create policy "anon insert spot checks" on public.spot_checks
for insert to anon with check (true);

drop policy if exists "anon update spot checks" on public.spot_checks;
create policy "anon update spot checks" on public.spot_checks
for update to anon using (true) with check (true);

grant select, insert, update on public.spot_checks to anon;
