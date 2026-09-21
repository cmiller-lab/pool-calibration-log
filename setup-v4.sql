-- Pool Calibration Log v4
alter table public.feeder_cleanings add column if not exists audit_note text;
grant select, insert, update, delete on public.feeder_cleanings to anon;
