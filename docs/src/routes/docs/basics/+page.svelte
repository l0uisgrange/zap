<script lang="ts">
	import { onMount } from 'svelte';
	import NavButton from '$lib/components/NavButton.svelte';
	import NexPrev from '$lib/components/NexPrev.svelte';
	import Code from '$lib/components/Code.svelte';
	import { version } from '$lib';

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
	<title>Basics</title>
</svelte:head>

<div class="items-stretch md:flex">
	<main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10">
		<h1>Basics</h1>
		<p class="max-w-2xl text-lg">
			Before diving into the complexity, it is necessary to explore some fundamental concepts from Zap, which will help you start very easily.
		</p>

		<h2>Canvas</h2>
		<p>
			All diagrams drawn must be contained within a <span class="text-component font-mono">canvas</span> block. This block initializes the necessary
			drawing environment, managed by CeTZ, and allows you to place your components.
		</p>
		<Code
			content={`#import "@preview/zap:${version}"\n\n#zap.circuit({\n    import zap: *\n\n    resistor("r1", (0,0), (3,0), label: $R_1$)\n})`}
		/>

		<h2>Declaration</h2>
		<p>
			After you set up your circuit, you'll start adding different items called components. You add these components by using their own special
			functions.
		</p>
		<div class="mb-2 flex flex-wrap items-center justify-center gap-1 px-4 py-4 font-mono text-sm *:rounded-full *:px-3 *:py-1 *:font-light">
			<div class="bg-component/10 text-component">component</div>
			(
			<div class="bg-string/10 text-string">"name"</div>
			,
			<div class="bg-float/10">
				(<span class="text-float">0</span>,<span class="text-float">0</span>)
			</div>
			,
			<div class="bg-float/10">
				(<span class="text-float">0</span>,<span class="text-float">0</span>)
			</div>
			,
			<div class="bg-params/10">
				<span class="text-params">..params</span>
			</div>
			)
		</div>
		<p>
			You choose the type of <span class="text-component font-mono">component</span> you need from the
			<a href="/docs/components">full list</a>. Giving your component a
			<span class="text-string font-mono">name</span> is important as it lets you easily find and use this component later when you're building more
			of your circuit, and it helps you connect to its 'anchors' (connection points). We'll explain more about anchors next.
		</p>
		<p>
			The <span class="text-params font-mono">params</span> are settings that let you change how your component looks or what it does. For
			example, you can add a label like
			<span class="inline-flex flex-nowrap">
				<span class="text-params mr-1.5 font-mono">label:</span>
				<span class="text-string font-mono">$R_1$</span>
			</span> to make things clearer or to show specific details, like the value of a resistor.
		</p>

		<NexPrev next={{ href: '/docs/positioning', title: 'Positioning' }} previous={{ href: '/docs/', title: 'Get started' }} />
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
