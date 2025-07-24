<script lang="ts">
	import Code from '$lib/components/Code.svelte';
	import example1 from '$lib/examples/example1.svg';
	import example2 from '$lib/examples/example2.svg';
</script>

<svelte:head>
	<title>Getting started</title>
</svelte:head>

<main class="block p-5 py-10">
	<h1>Examples</h1>
	<p class="max-w-2xl text-lg">
		Explore the examples below to see Zap's advanced capabilities in action and discover just how easy it is to program complex circuit diagrams.
	</p>
	<h2>Simple example</h2>
	<div class="grid gap-7 md:grid-cols-2">
		<div class="dark:border-neutral-border flex items-center justify-center overflow-scroll rounded-lg border border-neutral-200 bg-white">
			<img src={example1} alt="example1" class="p-10" />
		</div>
		<Code
			content={'#zap.canvas({\n' +
				'    import zap: *\n' +
				'\n' +
				'    // Branch 1' +
				'	 resistor("r1", (0,3), (3,3), label: $3 Omega$)\n' +
				'	 vsource("v1", (0,0), (0,3), label: (content: "V1", anchor: "south"))\n' +
				'    resistor("r2", (0,0), (0,-3), label: $4 Omega$)\n' +
				'\n' +
				'    // Branch 2\n' +
				'    led("l1", "r1.out", (rel: (0,-6)), label: (content: "LED", anchor: "south"))\n' +
				'    inductor("i2", "r1.out", (rel: (3,0)), label: $6 mu"H"$)\n' +
				'    resistor("r3", "i2.out", (rel: (0,-6)), label: $2 Omega$)\n' +
				'\n' +
				'    // Wiring\n' +
				'    wire("r2.out", "r3.out")\n' +
				'})'}
		/>
	</div>
	<h2>Wheatstone bridge</h2>
	<div class="grid gap-7 md:grid-cols-2">
		<div class="dark:border-neutral-border flex items-center justify-center overflow-scroll rounded-lg border border-neutral-200 bg-white">
			<img src={example2} alt="example2" class="p-10" />
		</div>
		<Code
			content={'#zap.canvas({\n' +
				'    import zap: *\n' +
				'\n' +
				'    // Wheatstone bridge\n' +
				'    resistor("r1", (4,0), (6,2), label: "R1", variable: true)\n' +
				'    resistor("r2", (6,2), (4,4), label: "R2")\n' +
				'    resistor("r3", (4,0), (2,2), label: (content: "R3", anchor: "south"))\n' +
				'    resistor("r4", (2,2), (4,4), label: (content: "R4", anchor: "south"))\n' +
				'\n' +
				'    // Voltage source\n' +
				'    vsource("v1", (0,0), (0,4), label: (content: "R1", anchor: "south"))\n' +
				'\n' +
				'    // Capacitor & motor\n' +
				'    capacitor("c1", "r2.out", (8,4), label: "C1")\n' +
				'    dcmotor("m1", "c1.out", (rel: (0,-4)))\n' +
				'\n' +
				'    // Wiring\n' +
				'    wire("v1.in", "m1.out")\n' +
				'    wire("v1.out", "r4.out")' +
				'})'}
		/>
	</div>
</main>
