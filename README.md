# Pool Calibration Log v3

Adds a shared **Pulsar Feeder Cleaning** module.

## New in v3
- 65 individual Pulsar feeders with permanent letter IDs
- Stable two-session split: 32 feeders / 33 feeders
- Multi-feeder pools alternate A/C/E/G/I vs B/D/F/H/J
- Single-feeder pools balanced between sessions while preserving property grouping
- Monthly Session 1 / Session 2 work queue
- Editable cleaning dates
- Feed Down and Cleaned sign-offs with technician + timestamp
- Shared quick notes for equipment issues
- Property filters and progress KPIs
- Synchronized calibration-record deletion
- iPhone safe-area/header adjustment

## Install
1. Run `setup-v3-feeder-cleaning.sql` once in Supabase SQL Editor.
2. Upload/replace the files in the GitHub repo root.
3. Keep GitHub Pages on `main` / `(root)`.


## v4.1 cache/version update
The page now displays `v4.1` beside the app title and at the bottom of the page.
The service worker uses a new cache ID and network-first navigation so a newly
deployed GitHub Pages build should not remain stuck on an older cached index.
