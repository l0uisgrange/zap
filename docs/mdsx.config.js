import { defineConfig } from 'mdsx';
import { rehypeCustomHighlight } from '@mdsx/rehype-custom-highlighter';


/** @type {import('@mdsx/rehype-custom-highlighter').HighlightOptions} */
const highlightOptions = {
	highlight: async ({ value, lang, meta }) => {
		// your highlighting logic here
		return value;
	},
};

export const mdsxConfig = defineConfig({
	blueprints: {
		default: {
			path: "src/lib/blueprints/default/blueprint.svelte",
		},
	},
	extensions: ['.md'],
	rehypePlugins: [[rehypeCustomHighlight, highlightOptions]],
});