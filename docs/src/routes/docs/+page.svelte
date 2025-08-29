<script lang="ts">
	import Code from '$lib/components/Code.svelte';
	import { Notice, version } from '$lib';
	import { onMount } from 'svelte';
	import NavButton from '$lib/components/NavButton.svelte';
	import NexPrev from '$lib/components/NexPrev.svelte';
    import {contributors} from "$lib/components";
    import Avatar from "./components/[id]/Avatar.svelte";

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
	<title>Introduction</title>
</svelte:head>

<div class="md:flex md:items-stretch">
	<main class="min-h-dvh flex-auto p-5 pt-10 md:px-8 md:py-10">
		<h1>Introduction</h1>
		<p class="max-w-2xl text-lg">
            Draw electronic circuits effortlessly in Typst with Zap. Powered by CeTZ, it offers simple functions to place and connect symbols directly in your documents.
		</p>
		<h2>Contributors</h2>
        <p>
            Special thanks to all the contributors who bring amazing features and bug fixes.
        </p>
		<div class="flex flex-wrap gap-3 mt-4">
            {#each contributors as c}
                <Avatar username={c} class="size-10!" />
            {/each}
        </div>
		<NexPrev next={{ href: '/docs/get-started', title: 'Get started' }} />
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
