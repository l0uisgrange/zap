<script lang="ts">
	import Code from '$lib/components/Code.svelte';
	import onenode from './one-node.svg';
	import twonode from './two-nodes.svg';
	import nodes from './nodes.svg';
	import { onMount } from 'svelte';
	import NavButton from '$lib/components/NavButton.svelte';
	import { Notice } from '$lib';
	import NexPrev from '$lib/components/NexPrev.svelte';
    import node from "$lib/images/node.svg";

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
	<title>Positioning</title>
</svelte:head>

<div class="items-stretch md:flex">
	<main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10">
		<h1>Positioning</h1>
		<p class="max-w-2xl text-lg">Zap simplifies component positioning through CeTZ, providing two methods for placing your circuit elements.</p>
		<h2>Component placement</h2>
		<p>
			To position components within your circuit, you can choose to either attach them to a single node, or place them between two nodes with
			automatic wiring.
		</p>
		<div class="mb-4 grid gap-7 md:grid-cols-2">
			<div>
				<div class="dark:border-neutral-800 mb-4 flex max-h-40 items-center overflow-hidden rounded-lg border border-neutral-200">
					<img src={onenode} class="w-full" alt="resistor using one-node placement" />
				</div>
				<Code content={'#zap.circuit({\n' + '    resistor("r1", (0,0))\n' + '})'} />
			</div>
			<div>
				<div class="dark:border-neutral-800 mb-4 flex max-h-40 items-center overflow-hidden rounded-lg border border-neutral-200">
					<img src={twonode} class="w-full" alt="resistor using one-node placement" />
				</div>
				<Code content={'#zap.circuit({\n' + '    resistor("r1", (0,0), (5,0))\n' + '})'} />
			</div>
		</div>
		<Notice type="warning" title="Warning">
			The two-node placement method is <span class="font-medium">only suitable for components that can be represented with two connections</span
			>. For example, a MOSFET or BJT transistor requires three nodes, so it can only be placed using the one-node placement method.
		</Notice>
		<h2>Cartesian coordinates</h2>
		<p>
			The most fundamental coordinate, like the example provided, is a <a
				href="https://typst.app/docs/reference/foundations/array/"
				target="_blank">Typst array</a
			>
			with two dimensions (<span class="text-float font-mono">x</span> representing the horizontal position, and
			<span class="text-float font-mono">y</span> the vertical).
		</p>
		<Code content={'#let myCoordinate = (0, 0)'} />
		<h2 class="mt-3">Named anchors</h2>
		<p>
			Sometimes, you just want to connect a node from one component to another without worrying about coordinates or doing mental math. That’s
			where named anchors come in.
		</p>
		<p>The name provided as the first argument acts as an identifier for the component, as shown below.</p>
		<Code content={'#zap.circuit({\n' +'    import zap: *\n\n' +  '    resistor("r1", (0,0), (5,0))\n' + '})'} />
		<p>
			Now that this resistor is identified by its name <span class="text-string font-mono">r1</span>, we can attach a voltage source to one of
			it's nodes like this.
		</p>
		<Code content={'#zap.circuit({\n' +'    import zap: *\n\n' + '    resistor("r1", (0,0), (5,0))\n' + '    vsource("v1", "r1.out", (5,5))\n' + '})'} />
		<p>
			The only slightly tricky part is knowing which sub-anchors each component provides, but don't worry, you can always refer to the <a
				href="/docs/components/">components list</a
			> for a complete overview of available anchors.
		</p>
		<p>
			In most cases, especially with two-node components, you'll typically use <span class="text-string font-mono">in</span>
			and
			<span class="text-string font-mono">out</span>.
		</p>
        <h2 class="mt-3">Nodes</h2>
        <p>
            You can also use the <span class="font-mono text-component">node</span> component instead of anchors. They work pretty much the same, but <span class="font-mono text-component">node</span> can be shown using a circle.
        </p>
        <div class="grid gap-5 lg:grid-cols-4 mb-5">
            <div class="dark:border-neutral-800 flex items-center justify-center rounded-lg border border-neutral-200 bg-white p-3">
                <img src={node} alt="Style 1 example" />
            </div>
            <div class="lg:col-span-3">
                <Code
                        content={'#zap.circuit({\n' +
						'    import zap: *\n\n' +
						'    node("node1", (0,0), fill: true)\n' +
						'})'}
                />
            </div>
        </div>
        <p>It's also possible to display this nodes directly when calling your components. The nodes will then be placed and represent the <span class="text-string font-mono">in</span> and <span class="text-string font-mono">out</span> anchors.</p>
        <div class="grid gap-5 lg:grid-cols-4 mb-5">
            <div class="dark:border-neutral-800 flex items-center justify-center rounded-lg border border-neutral-200 bg-white p-3">
                <img src={nodes} alt="Style 1 example" />
            </div>
            <div class="lg:col-span-3">
                <Code
                        content={'#zap.circuit({\n' +
						'    import zap: *\n\n' +
						'    resistor("r1", (0,0), (3,0), n: "*-*")\n' +
						'})'}
                />
            </div>
        </div>
        <p>You can either have filled circles using <span class="font-mono text-string">*</span> or simple circles using <span class="font-mono text-string">o</span>. For example, <span class="font-mono text-string">o-*</span> will have a circle on the <span class="text-string font-mono">in</span> anchor and a filled circle on the <span class="text-string font-mono">out</span> anchor.</p>
        <h2 class="mt-3">Relative coordinates</h2>
		<p>
			Check the <a href="https://cetz-package.github.io/docs/basics/coordinate-systems/#relative">CeTZ documentation</a>
		</p>
		<h2 class="mt-3">Orthogonal</h2>
		<p>
			Check the <a href="https://cetz-package.github.io/docs/basics/coordinate-systems/#relative">CeTZ documentation</a>
		</p>
		<NexPrev next={{ href: '/docs/standards', title: 'Standards' }} previous={{ href: '/docs/basics', title: 'Basics' }} />
	</main>
	<div class="relative hidden w-72 flex-none p-5 md:block">
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
