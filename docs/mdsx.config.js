import { defineConfig } from 'mdsx';
import { rehypeCustomHighlight } from '@mdsx/rehype-custom-highlighter';
import { createHighlighterCore } from 'shiki/core';
import { createJavaScriptRegexEngine } from 'shiki/engine/javascript';
import * as typstLang from './src/lib/components/typst.tmLanguage.json' with { type: 'json' };

/** @type {import('@mdsx/rehype-custom-highlighter').HighlightOptions} */
const highlightOptions = {
	highlight: async ({ value, lang, meta }) => {
		if (!lang) return value;
		if (!highlighter) {
			highlighter = await highlighterPromise;
		}
		return highlighter.codeToHtml(value, { lang, themes: { light: 'github-light', dark: 'github-dark' } });
	}
};

const jsEngine = createJavaScriptRegexEngine();
let highlighter = null;

const highlighterPromise = createHighlighterCore({
	themes: [import('@shikijs/themes/github-light'), import('@shikijs/themes/github-dark')],
	langs: [typstLang],
	engine: jsEngine
});

export const mdsxConfig = defineConfig({
	extensions: ['.md'],
	rehypePlugins: [[rehypeCustomHighlight, highlightOptions]],
	blueprints: {
		default: {
			path: 'src/lib/blueprints/default/blueprint.svelte'
		}
	}
});
