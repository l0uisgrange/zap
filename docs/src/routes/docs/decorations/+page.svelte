<script lang="ts">
	import { onMount } from 'svelte';
	import NavButton from '$lib/components/NavButton.svelte';
	import NexPrev from '$lib/components/NexPrev.svelte';
	import Code from '$lib/components/Code.svelte';
	import decoration from './decoration.svg';
	import named from './named.svg';
	import namedcustom from './namedcustom.svg';
	import {Notice} from "$lib";
    import Type from "$lib/components/Type.svelte";

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
		<h1>Labels & decorations</h1>
		<p class="max-w-2xl text-lg">
			Using Zap, you can easily add labels and decorations to your components to represent currents, voltages, and flows.
		</p>
		<h2>Labels</h2>
		<p>
			You can name your components by giving them a label using the <span class="text-params font-mono">label</span> parameter.
		</p>
		<div class="grid gap-5 lg:grid-cols-4 mb-5">
			<div class="dark:border-neutral-border flex items-center justify-center rounded-lg border border-neutral-200 bg-white p-3">
				<img src={named} alt="Style 1 example" />
			</div>
			<div class="lg:col-span-3">
				<Code
						content={'#zap.circuit({\n' +
						'    import zap: *\n\n' +
						'    heater("v1", (0,-1), (0,2), label: $R$)\n' +
						'})'}
				/>
			</div>
		</div>
		<Notice type="info" title="Automatic positioning">
			The label positions itself automatically depending on the orientation of your component, even for special angles.
		</Notice>
		<h3 class="mt-8">Advanced labelling</h3>
		<p>Sometimes, the label is not displayed where you want (like in the middle of the neighbour component...).</p>
		<p>You can just give a dictionary instead of some content to customize this behavior, using the keys described in the table below.</p>
		<div class="grid gap-5 lg:grid-cols-4 mb-5">
			<div class="dark:border-neutral-border flex items-center justify-center rounded-lg border border-neutral-200 bg-white p-3">
				<img src={namedcustom} alt="Style 1 example" class="-mb-8" />
			</div>
			<div class="lg:col-span-3">
				<Code
						content={'#zap.circuit({\n' +
						'    import zap: *\n\n' +
						'    heater("v1", (0,-1), (0,2), label: (content: $R$, anchor: "south", distance: 20pt))\n' +
						'})'}
				/>
			</div>
		</div>
        <table>
            <thead>
            <tr class="*:border *:align-top *:text-left *:text-nowrap *:px-3 *:py-1 *:border-neutral-200 dark:*:border-neutral-700 *:font-medium">
                <th>Name</th>
                <th>Type</th>
                <th>Default value</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>
            <tr class="*:border *:align-top *:first:text-nowrap *:px-3 *:py-1 *:border-neutral-200 dark:*:border-neutral-700">
                <td>content</td>
                <td><Type type="content" /></td>
                <td class="italic">required</td>
                <td>Content of the label</td>
            </tr>
            <tr class="*:border *:align-top *:first:text-nowrap *:px-3 *:py-1 *:border-neutral-200 dark:*:border-neutral-700">
                <td>anchor</td>
                <td><Type type="coordinate" /></td>
                <td class="font-mono text-string">"north"</td>
                <td>Position of the label relative to the components anchors</td>
            </tr>
            <tr class="*:border *:align-top *:first:text-nowrap *:px-3 *:py-1 *:border-neutral-200 dark:*:border-neutral-700">
                <td>distance</td>
                <td><Type type="length" /></td>
                <td class="text-float font-mono">7pt</td>
                <td>Distance from the label to the component</td>
            </tr>
            </tbody>
        </table>
		<h2>Decorations</h2>
		<p>
			You can add labels for current, voltage, or generic flow to components using the <span class="text-params font-mono">i</span> (current),
			<span class="text-params font-mono">u</span>
			(voltage), or <span class="text-params font-mono">f</span> (flow) parameters. These parameters accept either a string for a simple label or
			a dictionary for more detailed customization, using the same intuitive behaviour as labels.
		</p>
		<div class="grid gap-5 mb-4 lg:grid-cols-4">
			<div class="dark:border-neutral-border flex items-center justify-center rounded-lg border border-neutral-200 bg-white p-3">
				<img src={decoration} alt="Style 1 example" />
			</div>
			<div class="lg:col-span-3">
				<Code
					content={'#zap.circuit({\n' +
						'    import zap: *\n\n' +
						'    vsource("v1", (0,-2), (0,2), u: $u_1$, i: (content: $i_1$, anchor: "west"), label: "5V")\n' +
						'})'}
				/>
			</div>
		</div>
        <p>The following keys are supported when using a dictionary</p>
        <table>
            <thead>
                <tr class="*:border *:align-top *:text-left *:text-nowrap *:px-3 *:py-1 *:border-neutral-200 dark:*:border-neutral-700 *:font-medium">
                    <th>Name</th>
                    <th>Type</th>
                    <th>Default value</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr class="*:border *:align-top *:first:text-nowrap *:px-3 *:py-1 *:border-neutral-200 dark:*:border-neutral-700">
                    <td>content</td>
                    <td><Type type="content" /></td>
                    <td class="italic">required</td>
                    <td>Content of the decoration label</td>
                </tr>
                <tr class="*:border *:align-top *:first:text-nowrap *:px-3 *:py-1 *:border-neutral-200 dark:*:border-neutral-700">
                    <td>anchor</td>
                    <td><Type type="coordinate" /></td>
                    <td class="font-mono text-string">"east"</td>
                    <td>Position of the decoration relative to the components anchors</td>
                </tr>
                <tr class="*:border *:align-top *:first:text-nowrap *:px-3 *:py-1 *:border-neutral-200 dark:*:border-neutral-700">
                    <td>invert</td>
                    <td><Type type="boolean" /></td>
                    <td class="text-import font-mono">false</td>
                    <td>Invert the direction of the decoration arrow</td>
                </tr>
                <tr class="*:border *:align-top *:first:text-nowrap *:px-3 *:py-1 *:border-neutral-200 dark:*:border-neutral-700">
                    <td>distance</td>
                    <td><Type type="length" /></td>
                    <td class="text-float font-mono">7pt</td>
                    <td>Distance from the decoration to the component</td>
                </tr>
                <tr class="*:border *:align-top *:first:text-nowrap *:px-3 *:py-1 *:border-neutral-200 dark:*:border-neutral-700">
                    <td>label-distance</td>
                    <td><Type type="length" /></td>
                    <td>N/A</td>
                    <td>Distance from the decoration to its label</td>
                </tr>
            </tbody>
        </table>
		<h2>Standards</h2>
		<span class="text-gray-600 italic dark:text-gray-400">
            It is currently not possible to use a different style than IEC. This feature is still under development
        </span>
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
