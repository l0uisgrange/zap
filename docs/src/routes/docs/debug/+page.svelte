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
	<title>Debugging</title>
</svelte:head>

<div class="items-stretch md:flex">
	<main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10">
		<h1>Debugging</h1>
		<p class="max-w-2xl text-lg">
			You'll often need some information on your components position, outputs and anchors. Zap will give you intuitive options for this.
		</p>
		<h2>Positioning</h2>
		<p>
			You can draw a grid to better understand the coordinates used by Zap to draw your components.
		</p>
		<Code
			content={`#import "@preview/cetz:${cetzversion}": grid\n#import "@preview/zap:${version}"\n\n#zap.circuit({\n    import zap: *\n\n    grid((-5,-5), (5,5))\n})`}
		/>
		<h2>Anchors</h2>
		<p>
			To check the anchors of your component, you can use the <span class="text-params font-medium">debug</span> option, which will show you the exact anchors position and name.
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
