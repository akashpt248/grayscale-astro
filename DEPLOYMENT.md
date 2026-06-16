# Vercel + Cloudflare Workers/D1

## Frontend
- Deploy this Astro app to Vercel.
- Set `PUBLIC_PROJECTS_API_URL` to your Worker URL, for example `https://grayscale-api.<your-subdomain>.workers.dev/projects`.

## Backend
- Create a Cloudflare Worker.
- Bind a D1 database to the Worker using the `DB` binding.
- Run the SQL migration in `cloudflare-worker/migrations/0001_init.sql`.
- Export the old `projects` rows as JSON, then run:
  - `node cloudflare-worker/scripts/import-projects.mjs --input legacy-projects.json --output cloudflare-worker/migrations/0002_seed_projects.sql`
  - `wrangler d1 execute grayscale --file=cloudflare-worker/migrations/0002_seed_projects.sql`
- If you still need to dump the legacy API first, hit `lp/astro-api/projects.php` and save the response JSON.

## Notes
- The frontend expects the same JSON shape as the current PHP endpoint.
- The Worker returns `{ status: true, data: [...] }` for `GET /projects`.
