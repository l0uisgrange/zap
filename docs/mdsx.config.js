import { defineConfig } from 'mdsx';

export const mdsxConfig = defineConfig({
	blueprints: {
		special: {
			path: "src/lib/blueprints/special/blueprint.svelte",
		},
	},
	extensions: ['.md'],
});