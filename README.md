# Pool Calibration Log v2

This version adds IndexedDB local persistence and Supabase shared synchronization.

## Setup
1. In Supabase, open SQL Editor.
2. Run the entire `setup.sql` file once.
3. Upload all files in this ZIP to the root of your GitHub repository, replacing the prior versions.
4. GitHub Pages remains `main` / `(root)`.

The app saves to IndexedDB first, so spot checks can be captured offline. When connectivity is available it synchronizes them to Supabase and downloads the shared history.

Security: the included RLS policies are intentionally permissive for the initial proof-of-concept. Before broad production use, add Supabase Auth and technician-specific access policies. Never put a service-role key in the frontend.
