import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import { mdsx } from 'mdsx';
import { mdsxConfig } from './mdsx.config.js';

// https://github.com/typst/typst/blob/main/tools/support/typst.tmLanguage.json

/** @type {import('@sveltejs/kit').Config} */
const config = {
	preprocess: [mdsx(mdsxConfig), vitePreprocess()],
	extensions: ['.svelte', '.md'],
	kit: {
		adapter: adapter({
			fallback: 'index.html',
			precompress: false
		})
	}
};

export default config;
