// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  vite: {
    server: {
      allowedHosts: ['c971-97-93-218-63.ngrok-free.app'],
    },
  },
});
