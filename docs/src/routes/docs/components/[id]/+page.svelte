<script lang="ts">
	import { type Component, components } from '$lib/components';
	import type { PageProps } from './$types';
	import { onMount } from 'svelte';
	import { version } from '$lib';
	import Code from '$lib/components/Code.svelte';
	import { goto } from '$app/navigation';
	import NexPrev from '$lib/components/NexPrev.svelte';
	import Type from '$lib/components/Type.svelte';
	import Avatar from './Avatar.svelte';

	let { params }: PageProps = $props();

	let component = $derived(components.find((c) => c.name === params.id));

	onMount(() => {
		if (!component) goto('/docs/components');
	});
</script>

<svelte:head>
	<title>Component : {component?.full_name}</title>
</svelte:head>

<div class="items-stretch md:flex">
	<main class="min-h-dvh flex-auto p-5 pt-10 md:px-8 md:py-10">
		<NexPrev top previous={{ href: '/docs/components', title: 'Components list' }} />
		<h1 class="mt-4 flex items-baseline gap-5 capitalize">
			{component?.full_name}
			{#if component?.release === version}
				<span class="rounded-full font-mono text-lg text-purple-500">New</span>
			{/if}
		</h1>
		<p class="flex items-center gap-2">
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
		<h2>Minimal usage</h2>
        <p>Here's a quick example on how to use this component.</p>
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-5">
            <div>
                <img src={component?.image} class="border border-gray-200 dark:border-gray-700 rounded-lg w-full" alt={component?.full_name} />
            </div>
            <div class="lg:col-span-2">
                <Code
                        content={`#import "@preview/zap:${version}"\n` +
					'\n' +
					'#zap.canvas({\n' +
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
	<div class="relative hidden w-72 flex-none p-5 md:block"></div>
</div>

<!--
		{#if selectedComponent.release}
			<p class="mt-1 flex items-center gap-1 font-normal">
				<span>Available since</span>
				<span class="font-mono text-sm text-gray-500 lowercase">
					v{selectedComponent.release}
				</span>
			</p>
		{/if}
		<div class="grid items-start">
			{#if selectedComponent.options && selectedComponent.options.length > 0}
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
						{/each}
					</ul>
				</div>
			{/if}
		</div>
	</div>
{/if}

-->
