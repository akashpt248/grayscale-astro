import { defineConfig } from 'astro/config';

// Match XAMPP path from lp/bpcore/config.php (ROUTER_SUB_URL)
export default defineConfig({
  // Subpath under XAMPP; align with ROUTER_SUB_URL in lp/bpcore/config.php
  base: '/grayscale/',
});
