<script lang="ts">
	import { onMount } from 'svelte';
	import NavButton from '$lib/components/NavButton.svelte';
	import { Notice } from '$lib';
	import ieee from '$lib/images/standards/ieee.svg';
	import iec from '$lib/images/standards/iec.svg';
	import jis from '$lib/images/standards/jis.svg';
	import resistor from '$lib/images/standards/resistor.svg';
	import resistorieee from '$lib/images/standards/resistor-ieee.svg';
	import gb from '$lib/images/standards/gb.svg';
	import NexPrev from '$lib/components/NexPrev.svelte';
	import Code from '$lib/components/Code.svelte';

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

	const standards = [
		{
			name: 'IEC 60617',
			logo: iec,
			description: 'The leading international standard, widely adopted globally, especially in Europe.',
			status: 'Active',
			statusColor: 'text-green-600',
			lastUpdate: '2025',
		},
		{
			name: 'IEEE/ANSI 315-1975',
			logo: ieee,
			description: 'The primary standard for electrical and electronics symbols in North America.',
			status: 'Inactive',
			statusColor: 'text-red-600',
			lastUpdate: '2019',
		},
		{
			name: 'JIS C 0617',
			logo: jis,
			description: 'The official Japanese standard, largely harmonized with the international IEC series.',
			status: 'Active',
			statusColor: 'text-green-600',
			lastUpdate: '2018',
		},
		{
			name: 'GB/T 4728',
			logo: gb,
			description: 'The official Chinese national standard, also closely aligned with IEC guidelines.',
			status: 'Active',
			statusColor: 'text-green-600',
			lastUpdate: '2024',
		}
	];
</script>

<svelte:head>
	<title>Standards</title>
</svelte:head>

<div class="items-stretch md:flex">
	<main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10">
		<h1>Standards</h1>
		<p class="max-w-2xl text-lg">
			Zap allows you to switch between different standards inspired symbols to help everyone understand your schematics quickly.
		</p>
		<h2>Standards history</h2>
		<p>
			As industries have become more interconnected through globalization, numerous standards have emerged. Many of these have since been
			replaced by a smaller set of conventions that have gained wider global acceptance.
		</p>
		<div class="mt-6 mb-7 grid gap-6 lg:grid-cols-2">
			{#each standards as standard (standard.name)}
				<div class="border-gray-300 dark:border-gray-700 border relative overflow-hidden rounded-lg p-5">
					<img src={standard.logo} class="mb-4 h-7" alt="{standard.name} logo" />
					<h5 class="mb-1 text-xl font-medium">{standard.name}</h5>
					<p>{standard.description}</p>
					<div class="mt-5 flex items-center gap-2">
						<span>Status</span>
						<span class="ml-auto {standard.statusColor}">{standard.status}</span>
						<span class="text-sm text-gray-700 dark:text-gray-400">({standard.status === 'Active' ? 'last update' : 'since'} {standard.lastUpdate})</span>
					</div>
				</div>
			{/each}
		</div>
		<h2>Use standard</h2>
		<p>
			Only the IEC and IEEE/ANSI standards inspirations are supported by Zap. You can switch between them in your components by using the <span
				class="text-params">variant</span
			>
			parameter to either <span class="text-string">iec</span> or <span class="text-string">ieee</span>.
		</p>
        <Notice type="danger" title="Disclaimer">
            This project is <span class="font-medium">not affiliated with, endorsed by, or certified</span> by the IEC, the IEEE, or any other standards organization. The symbols are only inspired by these standards and not reproductions of their official symbols.
        </Notice>
		<div class="grid gap-7 lg:grid-cols-2">
			<div class="flex h-32 relative items-center justify-center rounded-lg border border-gray-300 bg-white dark:border-gray-700">
				<img src={resistor} class="mb-4 h-18" alt="Classic IEC resistor" />
                <span class="absolute top-2 left-2 bg-gray-500/20 rounded-full font-mono text-xs px-2 py-0.5 ">iec</span>
			</div>
			<div class="lg:order-3">
				<Code content={'#zap.circuit({\n' + '    resistor("r1", (0,0), (3,0))\n' + '})'} />
			</div>
			<div class="flex h-32 items-center relative justify-center rounded-lg border border-gray-300 bg-white dark:border-gray-700">
				<img src={resistorieee} class="mb-4 h-18" alt="Classic IEEE/ANSI resistor" />
                <span class="absolute top-2 left-2 bg-gray-500/20 rounded-full font-mono text-xs px-2 py-0.5 ">ieee</span>
			</div>
			<div class="lg:order-last">
				<Code content={'#zap.circuit({\n' + '    resistor("r1", (0,0), (3,0), variant: "ieee")\n' + '})'} />
			</div>
		</div>
		<NexPrev next={{ href: '/docs/decorations', title: 'Decorations' }} previous={{ href: '/docs/positioning', title: 'Positioning' }} />
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
