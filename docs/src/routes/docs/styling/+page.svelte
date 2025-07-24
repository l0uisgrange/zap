<script lang="ts">
	import { onMount } from 'svelte';
	import NavButton from '$lib/components/NavButton.svelte';
	import NexPrev from '$lib/components/NexPrev.svelte';
	import Code from '$lib/components/Code.svelte';
	import style1 from '$lib/examples/style1.svg';
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
	<title>Styling</title>
</svelte:head>

<div class="items-stretch md:flex">
	<main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10">
		<h1>Styling</h1>
		<p class="max-w-2xl text-lg">
			Zap allows you to style most electrical components using optional arguments passed during their declaration or simple global settings.
		</p>
		<h2>Specific component</h2>
		<p>
			If you want to customize the appearance of a <span class="font-medium">single component instance</span>, rather than all components of the
			same type, simply use the various
			<span class="text-params font-mono">params</span> optional arguments.
		</p>
		<Code
			content={'#zap.canvas({\n' +
				'    import zap: *\n\n' +
				'    resistor("r1", (0,0), (3,0), variant: "iec", fill: red.lighten(80%), stroke: 1pt + red)\n})'}
		/>
		<h2>Global styling</h2>
		<p>
			If you wish to change the default appearance for <span class="font-medium">all components</span>
			of a specific type throughout the same canvas, Zap supports the
			<span class="text-import font-mono">set-style</span> from CeTZ.
		</p>
		<div class="grid gap-5 lg:grid-cols-4">
			<img src={style1} class="dark:border-neutral-border w-full rounded-lg border border-neutral-200 object-cover" alt="Style 1 example" />
			<div class="lg:col-span-3">
				<Code
					content={'#zap.canvas({\n' +
						'    import zap: *\n' +
						'    set-style(zap: (\n' +
						'        resistor: (\n' +
						'            variant: "iec", \n' +
						'            fill: red.lighten(80%), \n' +
						'            stroke: 1pt + red\n' +
						'        ),\n' +
						'        wires: (stroke: .5pt+blue)\n' +
						'    ))\n\n    // Your amazing circuit\n})'}
				/>
			</div>
		</div>
		<h2>Style resolution</h2>
		<p>
			Zap first takes the style from the optional <span class="text-params font-mono">params</span>
			of your components, and merges them (with override) with the
			<span class="text-import font-mono">set-style</span> options.
		</p>

		<NexPrev previous={{ href: '/docs/decorations', title: 'Decorations' }} />
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
