# Pool Calibration Log

Mobile-first Progressive Web App for pool controller spot checks, calibration history, and pool-specific ORP/FC/pH historical analysis.

## Current build
- Property and pool dropdowns
- 24 configured pool bodies across Aquatica, SeaWorld, and Discovery Cove
- Controller vs independent-test pH and free chlorine readings
- Live Controller − Test offsets
- Controller ORP capture
- Optional calibration/post-calibration logging
- Per-pool recent history
- 7/30/90 day and all-history views
- Median absolute pH and FC offsets
- Historical ORP scatter chart using field-test FC and controller ORP
- Comparable-history ORP estimate using field-test FC and pH windows
- Offline PWA/service worker
- Local-device storage

## Important
This is a **local test build**. Records are stored in the browser's localStorage on that device/browser only. They are not shared between technicians or devices yet.

The planned production architecture is GitHub Pages + Supabase + offline queue/IndexedDB. Do not place Supabase service-role credentials or controller credentials in this public repository.

## GitHub Pages
Upload these files to the repository root, then enable GitHub Pages from the `main` branch/root folder.
