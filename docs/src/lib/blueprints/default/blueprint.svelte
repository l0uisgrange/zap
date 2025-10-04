<script lang="ts" module>
    import { onMount } from "svelte";

    export { default as p } from './p.svelte';
    export { default as a } from './a.svelte';
    export { default as h1 } from './h1.svelte';
    export { default as h2 } from './h2.svelte';
    export { default as h3 } from './h3.svelte';
    export { default as h4 } from './h4.svelte';
    export { default as h5 } from './h5.svelte';
    export { default as h6 } from './h6.svelte';
    export { default as ul } from './h6.svelte';
    export { default as ol } from './h6.svelte';
    export { default as li } from './h6.svelte';
    export { default as code } from './code.svelte';
    export { default as pre } from './pre.svelte';
    export { default as img } from './img.svelte';
    export { default as blockquote } from './h6.svelte';
    export { default as hr } from './h6.svelte';
    export { default as table } from './h6.svelte';
    export { default as thead } from './h6.svelte';
    export { default as dbody } from './h6.svelte';
    export { default as tr } from './h6.svelte';
    export { default as th } from './h6.svelte';
    export { default as td } from './h6.svelte';
</script>

<script lang="ts">
    import NavButton from "$lib/components/NavButton.svelte";
    import NexPrev from "$lib/components/NexPrev.svelte";

    let {
        metadata,
        children,
    }: {
        metadata: Record<string, unknown>;
        children: any;
    } = $props();

    let headings = $state([]);
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
    <title>{metadata.title}</title>
</svelte:head>

<div class="items-stretch overflow-hidden md:flex w-full! bg-neutral-50 dark:bg-neutral-950">
    <article class="min-h-dvh max-w-full overflow-hidden p-5 flex-auto pt-10 md:px-10 md:py-10">
        <h1 class="scroll-mt-32">{metadata.title}</h1>
        <p class="max-w-2xl text-lg">{metadata.subtitle}</p>
        {@render children?.()}
        {#if metadata.next}

        {/if}
    </article>
    <div class="hidden w-72 flex-none p-5 md:block">
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

