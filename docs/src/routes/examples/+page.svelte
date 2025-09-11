<script lang="ts">
	import Code from '$lib/components/Code.svelte';
	import example1 from '$lib/examples/example1.svg';
	import example2 from '$lib/examples/example2.svg';
	import example3 from '$lib/examples/example3.svg';
	import example4 from '$lib/examples/example4.svg';
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
			content={'#zap.circuit({\n' +
				'    import zap: *\n' +
				'\n' +
				'    // Branch 1\n' +
				'	resistor("r1", (0,3), (3,3), label: $3 Omega$)\n' +
				'	vsource("v1", (0,0), (0,3), label: (content: "V1", anchor: "south"))\n' +
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
			content={'#zap.circuit({\n' +
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
				'    wire("v1.out", "r4.out")\n' +
				'})'}
		/>
	</div>
	<h2>Transistor and charge</h2>
	<div class="grid gap-7 md:grid-cols-2">
		<div class="dark:border-neutral-border flex items-center justify-center overflow-scroll rounded-lg border border-neutral-200 bg-white">
			<img src={example3} alt="example3" class="p-10" />
		</div>
		<Code
				content={'#zap.circuit({\n' +
				'    import zap: *\n' +
				'\n' +
				'    // Source and transistor\n' +
				'    npn("d1", (3,3))\n'+
				'    wire("d1.b", ("d1.b", "-|", (0,3)), (0,3))\n'+
				'    acvsource("v1", (0,-1), (0,3), label: (content: "10V", anchor: "south"), u: $u_1$)\n'+
				'\n'+
				'    // Capacitor and charge\n' +
				'    capacitor("c1", ("d1.e", "|-", "v1.in"), "d1.e", label: $C$)\n'+
				'    wire("d1.c", (rel: (2,0)))\n'+
				'    rheostat("r1", (rel: (2,0), to: "d1.c"), ((rel: (2,0), to: "d1.c"), "|-", "v1.in"), label: $R_"ch"$)\n'+
				'\n' +
				'    // Bottom wiring\n' +
				'    wire("r1.out", "v1.in")\n' +
				'})'}
		/>
	</div>
    <h2>Customization</h2>
    <div class="grid gap-7 md:grid-cols-2">
        <div class="dark:border-neutral-border flex items-center justify-center overflow-scroll rounded-lg border border-neutral-200 bg-white">
            <img src={example4} alt="example4" class="p-10" />
        </div>
        <Code content={'' +
            '#zap.circuit({\n' +
            '    import zap: *\n' +
            '    \n' +
            '    resistor("r1", (2,0), (4,2))\n' +
            '    resistor("r2", (6,0), (4,2))\n' +
            '    resistor("r3", (6,0), (4,-2))\n' +
            '    resistor("r4", (2,0), (4,-2))\n' +
            '    afuse("f1", (2,2), "r1.out", position: 40%)\n' +
            '    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (content: $i_1$, anchor: "south"), label: "5V")\n' +
            '    wire("r4.out", (2,-2))\n' +
            '    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))\n' +
            '    wire("r1.out", "n1.b")\n' +
            '    capacitor("c1", "n1.e", (rel: (2,0)))\n' +
            '    wire("n1.c", ((), "|-", "r4.out"), "r4.out")\n' +
            '    wire("c1.out", ((), "|-", "r4.out"), "r4.out")\n' +
            '})'+
         ''}/>
    </div>
</main>
