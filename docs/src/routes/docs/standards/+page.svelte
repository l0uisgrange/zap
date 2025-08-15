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
			isRecommended: true
		},
		{
			name: 'IEEE/ANSI 315-1975',
			logo: ieee,
			description: 'The primary standard for electrical and electronics symbols in North America.',
			status: 'Inactive',
			statusColor: 'text-red-600',
			lastUpdate: '2019',
			isRecommended: false
		},
		{
			name: 'JIS C 0617',
			logo: jis,
			description: 'The official Japanese standard, largely harmonized with the international IEC series.',
			status: 'Active',
			statusColor: 'text-green-600',
			lastUpdate: '2018',
			isRecommended: false
		},
		{
			name: 'GB/T 4728',
			logo: gb,
			description: 'The official Chinese national standard, also closely aligned with IEC guidelines.',
			status: 'Active',
			statusColor: 'text-green-600',
			lastUpdate: '2024',
			isRecommended: false
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
			Zap allows you to switch between different standards adapted symbols to help everyone understand your schematics quickly.
		</p>
		<h2>Standards history</h2>
		<p>
			As industries have become more interconnected through globalization, numerous standards have emerged. Many of these have since been
			replaced by a smaller set of conventions that have gained wider global acceptance.
		</p>
		<Notice type="warning" title="Choice of standard">
			Using a common standard is <span class="font-medium">not a matter of design preference</span>. These standards are crucial to ensure that
			everyone can understand and correctly interpret your circuit diagrams, which is essential for collaboration and safety.
		</Notice>
		<div class="mt-6 mb-7 grid gap-6 lg:grid-cols-2">
			{#each standards as standard (standard.name)}
				{@const borderColor = standard.isRecommended
					? 'border-gray-900 dark:border-white border-2'
					: 'border-gray-300 dark:border-gray-700 border'}
				<div class="{borderColor} relative overflow-hidden rounded-lg p-5">
					{#if standard.isRecommended}
						<div class="absolute top-5 right-5 rounded-full text-xs font-medium uppercase">Recommended</div>
					{/if}
					<img src={standard.logo} class="mb-4 h-7" alt="{standard.name} logo" />
					<h5 class="mb-1 text-xl font-medium">{standard.name}</h5>
					<p>{standard.description}</p>
					<div class="mt-5 flex items-center gap-2">
						<span>Status</span>
						<span class="ml-auto {standard.statusColor}">{standard.status}</span>
						<span class="text-sm text-gray-700">({standard.status === 'Active' ? 'last update' : 'since'} {standard.lastUpdate})</span>
					</div>
				</div>
			{/each}
		</div>
		<h2>Use standard</h2>
		<p>
			Only the IEC and IEEE/ANSI standards are supported by Zap. You can switch between them in your components by using the <span
				class="text-params">variant</span
			>
			parameter to either <span class="text-string">iec</span> or <span class="text-string">ieee</span>.
		</p>
		<Notice type="danger" title="IEEE/ANSI Status">
			The IEEE/ANSI 315-1975 standard was <span class="font-medium">marked "inactive-reserved"</span> on November 7, 2019. Since this means the standard
			is no longer maintained, it is recommended to use the new IEC standard for your circuits.
		</Notice>
		<div class="grid gap-7 lg:grid-cols-2">
			<div class="flex h-32 relative items-center justify-center rounded-lg border border-gray-300 bg-white dark:border-gray-700">
				<img src={resistor} class="mb-4 h-18" alt="Classic IEC resistor" />
				<img src={iec} class="size-6 absolute top-5 left-5" alt="IEC" />
			</div>
			<div class="lg:order-3">
				<Code content={'#zap.canvas({\n' + '    resistor("r1", (0,0), (3,0))\n' + '})'} />
			</div>
			<div class="flex h-32 items-center relative justify-center rounded-lg border border-gray-300 bg-white dark:border-gray-700">
				<img src={resistorieee} class="mb-4 h-18 opacity-40" alt="Classic IEEE/ANSI resistor" />
				<img src={ieee} class="h-5 absolute top-5 left-5 grayscale-100 opacity-40" alt="IEC" />
			</div>
			<div class="lg:order-last">
				<Code content={'#zap.canvas({\n' + '    resistor("r1", (0,0), (3,0), variant: "ieee")\n' + '})'} />
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
