<script lang="ts">
	import { components, type Component } from '$lib/components';
	import type { PageProps } from './$types';
	import { onMount } from 'svelte';
	import { version } from '$lib';
	import Code from '$lib/components/Code.svelte';
	import { goto } from '$app/navigation';
	import NexPrev from '$lib/components/NexPrev.svelte';
	import Type from '$lib/components/Type.svelte';
	import Avatar from './Avatar.svelte';
	import H2 from '$lib/blueprints/default/h2.svelte';
	import P from '$lib/blueprints/default/p.svelte';
	import Img from '$lib/blueprints/default/img.svelte';

	let { params }: PageProps = $props();

	let component: Component = $derived(components.find((c) => c.name === params.id)!);

	onMount(() => {
		if (!component) goto('/docs/components');
	});
</script>

<svelte:head>
	<title>{component?.full_name}</title>
</svelte:head>

<main class="min-h-dvh bg-neutral-50 p-5 pt-10 md:px-10 md:py-10 dark:bg-neutral-950">
	<NexPrev top previous={{ href: '/docs/symbols', title: 'Symbols list' }} />
	<h1 class="mt-4 flex items-baseline gap-5 capitalize">
		{component?.full_name}
		{#if component?.release === version}
			<span class="rounded-full font-mono text-lg font-normal -tracking-tight text-purple-500">New</span>
		{/if}
	</h1>
	<p class="flex flex-wrap items-center gap-2">
		Added in <span class="text-string">{component?.release}</span>
		{#if component?.contributors}by <Avatar username={component?.contributors[0]} displayUsername />
			{#if component?.contributors.length > 1}
				and upgraded by
				<span class="flex items-center">
					{#each component?.contributors.slice(1) as c}
						<Avatar username={c} displayUsername />
					{/each}
				</span>
			{/if}
		{/if}
	</p>
	<H2>Minimal usage</H2>
	<P>Here's a quick example on how to use this component.</P>
	<div class="flex flex-wrap gap-5">
		<Img src={component.image} alt={component?.full_name} />
		<div class="flex-auto">
			<Code
				content={`#import "@preview/zap:${version}"\n` +
					'\n' +
					'#zap.circuit({\n' +
					'    import zap: *\n' +
					'    \n' +
					`    ${component?.name}("id", (0,0)${component?.quick ? ', (5,0)' : ''})\n` +
					'})'}
			/>
		</div>
	</div>
	{#if component?.options && component?.options.length > 0}
		<h2>Options</h2>
		<div class="mt-3">
			<p>You are free to use these options as parameters in your component declaration to customize the appearance.</p>
			<ul class="ms-5 list-disc space-y-2.5">
				{#each component?.options ?? [] as opt}
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
				{/each}
			</ul>
		</div>
	{/if}
</main>
