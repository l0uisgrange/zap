import { defineConfig } from 'mdsx';

export const mdsxConfig = defineConfig({
	blueprints: {
		default: {
			path: "src/lib/blueprints/default/blueprint.svelte",
		},
	},
	extensions: ['.md'],
});