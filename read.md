# Grayscale (Astro) - How it Works

This project is a static Astro frontend for the Grayscale theme. It renders pages from `src/pages/` into HTML during `astro build`, and serves them via `astro dev`.

## 1) Routing / URLs

Astro uses **file-based routing**:

- `src/pages/index.astro`  -> `/grayscale/` (because your `base` is `/grayscale/`)
- `src/pages/about.astro`  -> `/grayscale/about/`
- `src/pages/projects.astro` -> `/grayscale/projects/`
- `src/pages/contact.astro` -> `/grayscale/contact/`

### Base path (`/grayscale/`)

Your `astro.config.mjs` sets:

- `base: '/grayscale/'`

This makes sure:
- links (like navbar links) are generated with the correct prefix
- static assets resolve correctly (CSS/JS/images)

If you ever want the site at `http://localhost:4321/` (instead of `/grayscale/`), change `base` to `/` and restart the dev server.

## 2) Pages

Pages live in `src/pages/`:

- `index.astro` (home / hero section)
- `about.astro` (about section)
- `projects.astro` (projects section)
- `contact.astro` (signup + contact section)

Each page wraps its content with the shared layout:

- `<BaseLayout> ...page content... </BaseLayout>`

## 3) Shared layout

The shared HTML shell (doctype, `<head>`, navbar, footer, and script tags) is defined in:

- `src/layouts/BaseLayout.astro`

Key responsibilities:
- Loads theme CSS: `css/styles.css`
- Loads theme JS: `js/scripts.js`
- Includes the Bootstrap navbar + footer markup
- Provides a `<slot />` where each page injects its content

`BaseLayout.astro` uses `import.meta.env.BASE_URL` to keep all asset and link URLs correct under `/grayscale/`.

## 4) Static assets

Astro serves static files from the `public/` directory.

This project copies the theme files into `public/`, so they exist at build/dev time:

- `public/css/styles.css`
- `public/js/scripts.js`
- `public/assets/img/*`

Astro emits them into `dist/` during `astro build`.

## 5) Scripts and commands

From the repo root (`/Applications/XAMPP/xamppfiles/htdocs/grayscale`):

### Development
```bash
npm run dev
```
Open the URL Astro prints (currently it works at):
- `http://localhost:4321/grayscale/`

### Production build
```bash
npm run build
```
Outputs to:
- `dist/`

### Production preview
```bash
npm run preview
```
Serves the contents of `dist/`.

## 6) What changed from the old PHP version?

The old `index.php` + router approach is no longer used for the frontend.

Now, the frontend is controlled by Astro:
- routing comes from `src/pages/*.astro`
- layout comes from `src/layouts/BaseLayout.astro`
- URLs are controlled by `astro.config.mjs` `base`

