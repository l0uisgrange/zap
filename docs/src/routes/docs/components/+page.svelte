<script lang="ts">
	import { Notice, version } from '$lib';
	import SearchInput from '$lib/components/SearchInput.svelte';
	import { type Component, components } from '$lib/components';
	import { fly } from 'svelte/transition';
	import { quintOut } from 'svelte/easing';
	import Code from '$lib/components/Code.svelte';
	import Type from '$lib/components/Type.svelte';

	let results = $state(components.toSorted((a, b) => a.name.localeCompare(b.name)));

	let selectedComponent: Component | null = $state(null);
	let isDrawerOpen = $state(false);

	function openDrawer(event: MouseEvent, component: Component) {
		event.preventDefault();
		selectedComponent = component;
		isDrawerOpen = true;
	}

	function closeDrawer() {
		isDrawerOpen = false;
		setTimeout(() => {
			selectedComponent = null;
		}, 300);
	}
</script>

<svelte:head>
	<title>Components</title>
</svelte:head>

<svelte:window
	onkeydown={(e) => {
		if (e.key === 'Escape' && isDrawerOpen) {
			e.preventDefault();
			closeDrawer();
		}
	}}
/>

<div class="items-stretch md:flex">
	<main class="min-h-dvh flex-auto p-5 pt-10 md:px-8 md:py-10">
		<h1>Components</h1>
		<p class="max-w-2xl text-lg">
			The package offers a wide range of standardized electronic component symbols according to international standards.
		</p>
		<h2>Components list</h2>
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
					onclick={(e) => openDrawer(e, component)}
					class="dark:border-neutral-border group relative flex h-40 cursor-pointer items-center justify-center overflow-hidden rounded-lg border border-neutral-200 text-current! decoration-0! hover:shadow-xs"
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
						<span class="absolute top-2 left-3 z-10 my-0 rounded-full font-mono text-purple-500"> New </span>
					{/if}
				</a>
			{/each}
		</div>
	</main>
	<div class="relative hidden w-72 flex-none p-5 md:block"></div>
</div>

{#if isDrawerOpen && selectedComponent}
	<button
		aria-label="ded"
		class="fixed inset-0 z-40 bg-black/15 backdrop-blur-sm"
		onclick={closeDrawer}
		transition:fly={{ duration: 200, opacity: 0 }}
	></button>
	<div
		class="md:h-dvg fixed right-0 bottom-0 left-0 z-50 max-h-[80dvh] overflow-y-auto bg-white p-6 shadow-lg md:top-0 md:left-auto md:max-h-none md:w-3/7 md:max-w-xl md:p-8 dark:bg-neutral-900"
		transition:fly={{ x: 500, duration: 300, easing: quintOut }}
	>
		<h2 class="mt-0! flex flex-wrap items-baseline gap-5 text-2xl font-bold capitalize">
			{selectedComponent.full_name}
			{#if selectedComponent.release === version}
				<span class="rounded-full font-mono text-lg text-purple-500">New</span>
			{/if}
		</h2>
		{#if selectedComponent.release}
			<p class="mt-1 flex items-center gap-1 font-normal">
				<span>Available since</span>
				<span class="font-mono text-sm text-gray-500 lowercase">
					v{selectedComponent.release}
				</span>
			</p>
		{/if}
		<div class="grid items-start">
			<div>
				<h3 class="mt-2">Example</h3>
				<p>Here's a quick example on how to use this component.</p>
				<Code
					content={`#import "@preview/zap:${version}"\n` +
						'\n' +
						'#zap.canvas({\n' +
						'    import zap: *\n' +
						'    \n' +
						`    ${selectedComponent.name}("id", (0,0)${selectedComponent.quick ? ', (5,0)' : ''})\n` +
						'})'}
				/>
			</div>
			<div class="mt-3">
				<h3>Options</h3>
				<p>You are free to use these options as parameters in your component declaration to customize the appearance.</p>
				<ul class="ms-5 list-disc space-y-2.5">
					{#each selectedComponent.options ?? [] as opt}
						<li>
							<span class="text-params font-mono">{opt.name}</span>
							{#if opt.type}<Type type={opt.type} />{/if}
							<p class="normal-case">{opt.description}</p>
							<ul class="ms-5">
								{#if opt.default}
									<li>Default value: <span class="text-string font-mono">{opt.default}</span></li>
								{/if}
								{#if opt.alias}
									<li>Alias: <span class="text-component font-mono">{opt.alias}</span></li>
								{/if}
							</ul>
						</li>
					{:else}
						<span class="italic text-gray-500">No options available for this component</span>
					{/each}
				</ul>
			</div>
		</div>
	</div>
{/if}
