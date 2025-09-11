<script lang="ts">
	import { onMount } from 'svelte';
	import NavButton from '$lib/components/NavButton.svelte';
	import NexPrev from '$lib/components/NexPrev.svelte';
	import Code from '$lib/components/Code.svelte';
    import {cetzversion, version} from '$lib';

	let headings: any[] = $state([]);

	onMount(() => {
		const headingElements = document.querySelectorAll('h1, h2, h3');
		headings = Array.from(headingElements).map((element, index) => {
			const uid = `heading-${index}`;
			element.id = uid;
			return {
				level: parseInt(element.tagName.substring(1)),
				text: element.textContent || '',
				uid
			};
		});
	});
</script>

<svelte:head>
	<title>Drawing</title>
</svelte:head>

<div class="items-stretch md:flex">
	<main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10">
		<h1>Drawing</h1>
		<p class="max-w-2xl text-lg">
			Zap uses CeTZ drawing engine in the background, and gives you the ability to interact with it by adding shapes and content.
		</p>

		<h2>Canvas</h2>
		<p>
			As discovered before, Zap uses a canvas as its drawing environment, it's therefore compatible with CeTZ native drawings.
		</p>
		<Code
			content={`#import "@preview/cetz:${cetzversion}": rect\n#import "@preview/zap:${version}"\n\n#zap.circuit({\n    import zap: *\n\n    resistor("r1", (0,0), (3,0), label: $R_1$)\n    rect((0,0), (5,5))\n})`}
		/>
        <p>
            You have access to all available shapes and options on the package online <a target="_blank" href="https://cetz-package.github.io/docs/api/draw-functions/shapes/">documentation</a>.
        </p>
	</main>
	<div class="relative hidden w-72 flex-none p-5 md:block">
		<ul class="sticky top-32 block">
			{#each headings as heading}
				<li style="margin-left: {heading.level * 10}px;">
					<NavButton href={`#${heading.uid}`}>
						{heading.text}
					</NavButton>
				</li>
			{/each}
		</ul>
	</div>
</div>
