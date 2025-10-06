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

<div class="min-h-dvh items-stretch bg-neutral-50 dark:bg-neutral-950">
	<main class="p-5 pt-10 md:px-10 md:py-10">
		<h1>Symbols</h1>
		<p class="max-w-2xl text-lg">The package offers a wide range of electronic symbols and variants inspired by international standards.</p>
		<h2 class="mt-8!">Symbols list</h2>
		<span class="h-5"></span>
		<SearchInput items={components} bind:results />
		<div class="mt-7 grid w-full grid-cols-2 gap-6 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">
			{#each results as component}
				<a
					href="/docs/components/{component.name}"
					class="group relative flex h-40 cursor-pointer items-center justify-center overflow-hidden rounded-lg border border-neutral-200 text-current! decoration-0! hover:shadow-xs dark:border-neutral-800"
				>
					<img
						src={component.image}
						alt={component.name}
						class="z-0 w-full max-w-none flex-none overflow-hidden object-contain transition group-hover:scale-105 lg:w-64"
					/>
					<div class="absolute bottom-3 left-3 rounded-full font-mono text-sm text-black antialiased">
						{component.name}
					</div>
					{#if component.release === version}
						<span class="absolute top-2 left-3 z-10 my-0 rounded-full font-normal -tracking-tight text-purple-500"> New </span>
					{/if}
				</a>
			{/each}
		</div>
	</main>
</div>
