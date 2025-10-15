<script lang="ts">
	let { children, active = false, href = null, newFeature = false, nextFeature = false } = $props();
</script>

<a
	{href}
	class="block {active && 'bg-neutral-100 dark:bg-neutral-900'} flex w-full max-w-none items-center justify-between rounded-md px-3 py-1 {href
		? 'cursor-pointer hover:bg-neutral-100 dark:hover:bg-neutral-900'
		: 'cursor-not-allowed'}"
>
	{@render children()}
	{#if newFeature}
		<span class="font-normal -tracking-tight text-purple-600">New</span>
	{/if}
	{#if nextFeature}
		<span class="-tracking-tight text-gray-400 dark:text-gray-600">Next</span>
	{/if}
</a>
