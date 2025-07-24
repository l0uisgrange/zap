<script lang="ts">
	import { onMount } from 'svelte';
	import Fuse from 'fuse.js';
	import type { Component } from '$lib/components';

	let { items, results = $bindable() } = $props();

	let searchQuery = $state('');
	let fuse: Fuse<Component>;

	onMount(() => {
		fuse = new Fuse(items, {
			keys: ['name', 'full_name'],
			threshold: 0.3,
			distance: 100,
			includeScore: true
		});
		results = items.toSorted((a, b) => a.name.localeCompare(b.name));
	});

	$effect(() => {
		if (!searchQuery.trim()) {
			results = items.toSorted((a, b) => a.name.localeCompare(b.name));
			return;
		}
		const searchResults = fuse.search(searchQuery);
		results = searchResults
			.map((result) => result.item)
			.toSorted((a, b) => a.name.localeCompare(b.name));
	});
</script>

<div class="max-w-sm">
	<div class="relative">
		<input
			type="text"
			bind:value={searchQuery}
			placeholder="Search components"
			class="dark:border-neutral-border w-full rounded-full border border-neutral-200 px-4 py-1.5 pl-10 subpixel-antialiased focus:border-blue-600 focus:ring-1 focus:ring-blue-600 focus:outline-none"
		/>
		<span
			class="icon-[hugeicons--search-01] absolute top-1/2 left-3 size-5 -translate-y-1/2 text-gray-500"
		></span>
		{#if searchQuery.trim()}
			<button
				class="absolute top-1/2 right-2 -translate-y-1/2 cursor-pointer rounded-full bg-neutral-800 px-3 py-1 text-xs text-white dark:bg-white dark:text-black"
				onclick={() => (searchQuery = '')}
			>
				cancel
			</button>
		{/if}
	</div>
</div>
