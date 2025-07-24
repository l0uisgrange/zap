<script lang="ts">
	let { type }: { type: string | string[] } = $props();

	const typeColors: Record<string, string> = {
		boolean: 'bg-green-100',
		string: 'bg-red-100',
		number: 'bg-purple-100',
		coordinate: 'bg-yellow-100',
		context: 'bg-blue-100',
		dictionary: 'bg-pink-100',
		none: 'bg-orange-100'
	};

	function getColorClass(itemType: string): string {
		return typeColors[itemType] || 'bg-gray-100';
	}
</script>

{#if typeof type === 'string'}
	<span class="mx-2 rounded-full {getColorClass(type)} px-2 py-0.5">{type}</span>
{:else}
	<span class="mx-2 inline-flex flex-wrap items-center gap-1">
		{#each type as item, i}
			<span class="rounded-full {getColorClass(item)} px-2 py-0.5">{item}</span>
			{#if i !== type.length - 1}
				<span class="mx-0.5">/</span>
			{/if}
		{/each}
	</span>
{/if}
