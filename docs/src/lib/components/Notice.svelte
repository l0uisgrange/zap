<script module lang="ts">
	function getTypeClasses(type: string): string {
		switch (type) {
			case 'info':
				return 'border-[#0969da]';
			case 'warning':
				return 'border-[#8250df]';
			case 'danger':
				return 'border-[#cf222e]';
			case 'tip':
				return 'border-[#1f883d]';
			case 'note':
				return 'border-[#59636e]';
			default:
				return 'border-blue-600';
		}
	}
	function getTextClasses(type: string): string {
		switch (type) {
			case 'info':
				return 'text-[#0969da]';
			case 'warning':
				return 'text-[#8250df]';
			case 'danger':
				return 'text-[#cf222e]';
			case 'tip':
				return 'text-[#1f883d]';
			case 'note':
				return 'text-[#59636e]';
			default:
				return 'text-blue-600';
		}
	}
</script>

<script lang="ts">
	import type { Snippet } from 'svelte';

	type NoticeType = 'info' | 'warning' | 'danger' | 'tip' | 'note';

	let {
		children,
		type = 'info',
		title = undefined
	} = $props<{ children: Snippet; type?: NoticeType; title?: string }>();
</script>

<div class="mb-4 border-l-4 px-4 subpixel-antialiased {getTypeClasses(type)}">
	{#if title}
		<div class="mb-1 font-medium {getTextClasses(type)}">{title}</div>
	{/if}
	<div>
		{@render children()}
	</div>
</div>
