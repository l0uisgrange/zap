<script lang="ts">
	import { onMount } from 'svelte';
	import NavButton from '$lib/components/NavButton.svelte';
	import NexPrev from '$lib/components/NexPrev.svelte';
	import Code from '$lib/components/Code.svelte';
	import style1 from '$lib/examples/style1.svg';
	import decoration from './decoration.svg';

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
	<title>Decorations</title>
</svelte:head>

<div class="items-stretch md:flex">
	<main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10">
		<h1>Decorations</h1>
		<p class="max-w-2xl text-lg">
			Using Zap, you can easily add decorations to your components and wires to represent currents, voltages, and flows.
		</p>
		<h2>Usage</h2>
		<p>
			You can add labels for current, voltage, or generic flow to components using the <span class="text-params font-mono">i</span> (current),
			<span class="text-params font-mono">u</span>
			(voltage), or <span class="text-params font-mono">f</span> (flow) parameters. These parameters accept either a string for a simple label or
			a dictionary for more detailed customization.
		</p>
		<div class="grid gap-5 lg:grid-cols-4">
			<div class="dark:border-neutral-border flex items-center justify-center rounded-lg border border-neutral-200 bg-white p-3">
				<img src={decoration} alt="Style 1 example" />
			</div>
			<div class="lg:col-span-3">
				<Code
					content={'#zap.canvas({\n' +
						'    import zap: *\n\n' +
						'    vsource("v1", (0,-2), (0,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")\n' +
						'})'}
				/>
			</div>
		</div>
		<h2>Standards</h2>
		<span class="text-gray-600 italic dark:text-gray-400"
			>It is currently not possible to use a different style than IEC. This feature is still under development</span
		>
		<NexPrev next={{ href: '/docs/styling', title: 'Styling' }} previous={{ href: '/docs/positioning', title: 'Positioning' }} />
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
