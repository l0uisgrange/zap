<script lang="ts">
	import type { HTMLAnchorAttributes } from 'svelte/elements';
	import type { Snippet } from 'svelte';

	let { href, children, ...restProps }: HTMLAnchorAttributes & { children: Snippet } = $props();

	const isExternal = $derived(!href!.startsWith('/'));
	const target = $derived(isExternal ? '_blank' : undefined);
</script>

<a {href} {target} {...restProps} class="text-blue-700 underline underline-offset-2 dark:text-blue-500">
	{@render children?.()}
	{#if isExternal}
		<span class="icon-[hugeicons--arrow-up-right-01] -mb-1 size-5"></span>
	{/if}
</a>
