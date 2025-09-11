<script lang="ts">
	import Code from '$lib/components/Code.svelte';
	import { Notice, version } from '$lib';
	import { onMount } from 'svelte';
	import NavButton from '$lib/components/NavButton.svelte';
	import NexPrev from '$lib/components/NexPrev.svelte';

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
	<title>Getting started</title>
</svelte:head>

<div class="md:flex md:items-stretch">
	<main class="min-h-dvh flex-auto p-5 pt-10 md:px-8 md:py-10">
		<h1>Getting started</h1>
		<p class="max-w-2xl text-lg">
			Everything has been thought to give you a complete and easy-to-use library. Zap is even published on Typst Universe.
		</p>
		<h2>Installation</h2>
		<p>
			Whether you're using the Typst online app or running Typst locally on your computer, you can start using Zap simply by adding <span
				class="text-import font-mono">import</span
			> at the top of your Typst file.
		</p>
		<Code content={`#import "@preview/zap:${version}"`} />
		<h2>Create your first circuit</h2>
		<p>To get started with Zap, here's a minimal working example showing how to draw a simple circuit with just a few lines of code.</p>
		<Notice type="tip" title="Tip"
			>It is recommended to import Zap components <span class="font-medium">inside your circuit</span>, as some Zap functions override some basic
			Typst elements.</Notice
		>
		<Code
			content={`#import "@preview/zap:${version}"\n` +
				'\n' +
				'#zap.circuit({\n' +
				'    import zap: *\n' +
				'    \n' +
				'    isource("i1", (0,0), (5,0))\n' +
				'})'}
		/>
		<h2>Contribute</h2>
		<p>I actively maintain Zap and greatly value community feedback.</p>
		<p>
			If you encounter a bug, spot an incorrect symbol, or have an idea for a new feature or electrical component, feel free to <a
				target="_blank"
				href="https://github.com/l0uisgrange/zap/issues/new">open an issue</a
			>
			or a
			<a href="https://github.com/l0uisgrange/zap/discussions/new" target="_blank">discussion</a> on the GitHub repository.
		</p>
		<div
			class="dark:*:border-neutral-border mt-5 grid gap-4 *:flex *:items-center *:gap-2 *:rounded-lg *:border *:border-neutral-200 *:p-4 *:transition *:hover:bg-gray-50 *:hover:shadow-xs md:grid-cols-3 dark:*:hover:bg-neutral-800 dark:*:hover:shadow-black"
		>
			<a class="block" target="_blank" href="https://github.com/l0uisgrange/zap/issues/new?template=new_component.yml">
				<span class="icon-[hugeicons--compass-01] size-6 text-blue-600"></span>
				<span class="text-black decoration-0 dark:text-white">Request a component</span>
			</a>
			<a class="block" target="_blank" href="https://github.com/l0uisgrange/zap/issues/new?template=bug_report.yml">
				<span class="icon-[hugeicons--bug-02] size-6 text-red-600"></span>
				<span class="text-black decoration-0 dark:text-white">Report bug or error</span>
			</a>
			<a class="block" target="_blank" href="https://github.com/l0uisgrange/zap/issues/new?template=feature_request.yml">
				<span class="icon-[hugeicons--bulb] size-6 text-green-600"></span>
				<span class="text-black decoration-0 dark:text-white">Suggest a feature</span>
			</a>
		</div>
		<NexPrev previous={{ href: '/docs', title: 'Introduction' }} next={{ href: '/docs/basics', title: 'Basics' }} />
	</main>
	<div class="relative hidden flex-none p-5 md:block md:w-72">
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
