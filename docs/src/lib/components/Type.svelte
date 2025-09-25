<script lang="ts">
	let { type }: { type: string | string[] } = $props();

	const typeColors: Record<string, string> = {
		boolean: 'bg-green-200 dark:bg-green-900',
		string: 'bg-red-200 dark:bg-red-900',
		number: 'bg-purple-200 dark:bg-purple-900',
		coordinate: 'bg-yellow-200 dark:bg-yellow-900',
		length: 'bg-indigo-200 dark:bg-indigo-900',
		context: 'bg-blue-200 dark:bg-blue-900',
		dictionary: 'bg-pink-200 dark:bg-pink-900',
		none: 'bg-orange-200 dark:bg-orange-900'
	};

	function getColorClass(itemType: string): string {
		return typeColors[itemType] || 'bg-gray-100 dark:bg-gray-800';
	}
</script>

{#if typeof type === 'string'}
	<span class="rounded-full {getColorClass(type)} px-2 py-0.5">{type}</span>
{:else}
	<span class="inline-flex flex-wrap items-center gap-1">
		{#each type as item, i}
			<span class="rounded-full {getColorClass(item)} px-2 py-0.5">{item}</span>
			{#if i !== type.length - 1}
				<span class="mx-0.5">/</span>
			{/if}
		{/each}
	</span>
{/if}
