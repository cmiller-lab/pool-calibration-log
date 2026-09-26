alter table public.feeder_cleanings add column if not exists feed_level text;
alter table public.feeder_cleanings add column if not exists level_updated_at timestamptz;
