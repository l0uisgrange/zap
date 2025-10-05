<script lang="ts">
	import { Notice, version } from '$lib';
	import SearchInput from '$lib/components/SearchInput.svelte';
	import { type Component, components } from '$lib/components';
	import { fly } from 'svelte/transition';
	import { quintOut } from 'svelte/easing';
	import Code from '$lib/components/Code.svelte';
	import Type from '$lib/components/Type.svelte';

	let results = $state(components.toSorted((a, b) => a.name.localeCompare(b.name)));
</script>

<svelte:head>
	<title>Components</title>
</svelte:head>

<div class="items-stretch md:flex">
	<main class="min-h-dvh flex-auto p-5 pt-10 md:px-8 md:py-10">
		<h1>Components</h1>
		<p class="max-w-2xl text-lg">
			The package offers a wide range of electronic symbols and variants inspired by international standards.
		</p>
		<h2>Symbols list</h2>
		<Notice title="Component suggestion">This project is just getting started. Component suggestions are welcome and appreciated!</Notice>
		<span class="h-5"></span>
		<SearchInput items={components} bind:results />
		<span class="mt-5 flex items-start gap-2 text-sm">
			<span class="-mt-0.5 flex size-6 flex-none items-center justify-center rounded-full bg-neutral-900 text-white">
				<span class="icon-[hugeicons--trapezoid-line-horizontal] size-4.5"></span>
			</span>
			This components can be declared using two coordinates, and will be automatically wired
		</span>
		<div class="mt-7 grid w-full grid-cols-2 gap-6 md:grid-cols-1 lg:grid-cols-2 xl:grid-cols-4">
			{#each results as component}
				<a
					href="/docs/components/{component.name}"
					class="dark:border-neutral-800 group relative flex h-40 cursor-pointer items-center justify-center overflow-hidden rounded-lg border border-neutral-200 text-current! decoration-0! hover:shadow-xs"
				>
					<img
						src={component.image}
						alt={component.name}
						class="z-0 w-full max-w-none flex-none overflow-hidden object-contain transition group-hover:scale-105 lg:w-64"
					/>
					<div class="absolute bottom-3 left-3 rounded-full bg-neutral-900/10 px-2 text-black backdrop-blur-3xl">
						{component.name}
					</div>
					{#if component.quick}
						<span class="absolute right-3 bottom-3 flex size-6 items-center justify-center rounded-full bg-neutral-900 text-white">
							<span class="icon-[hugeicons--trapezoid-line-horizontal] size-4.5"></span>
						</span>
					{/if}
					{#if component.release === version}
						<span class="absolute top-2 left-3 z-10 my-0 rounded-full font-normal text-purple-500 -tracking-tight"> New </span>
					{/if}
				</a>
			{/each}
		</div>
	</main>
	<div class="relative hidden w-72 flex-none p-5 md:block"></div>
</div>