<script lang="ts">
	let { username, displayUsername = false, ...rest } = $props();
</script>

<a href="https://github.com/{username}" class="flex items-center gap-2 text-blue-600 underline" target="_blank"
	><img src="https://github.com/{username}.png" class="{rest.class} size-6 rounded-full" alt="{username} profile picture" />
	{#if displayUsername}{username}{/if}</a
>
