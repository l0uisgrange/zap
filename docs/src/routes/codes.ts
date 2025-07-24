import { version } from '$lib';
import img1 from '$lib/hero/1.svg';
import img2 from '$lib/hero/2.svg';
import img3 from '$lib/hero/3.svg';
import img4 from '$lib/hero/4.svg';
import img5 from '$lib/hero/5.svg';
import img6 from '$lib/hero/6.svg';
import img7 from '$lib/hero/7.svg';
import img8 from '$lib/hero/8.svg';
import img9 from '$lib/hero/9.svg';
import img10 from '$lib/hero/10.svg';
import img11 from '$lib/hero/11.svg';
import img12 from '$lib/hero/12.svg';
import img13 from '$lib/hero/13.svg';
import img14 from '$lib/hero/14.svg';
import img15 from '$lib/hero/15.svg';
import img16 from '$lib/hero/16.svg';
import img17 from '$lib/hero/17.svg';
import img18 from '$lib/hero/18.svg';
import img19 from '$lib/hero/19.svg';
import img20 from '$lib/hero/20.svg';

export const codes = [
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0))\n' +
			'})',
		image: img1
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'})',
		image: img2
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'})',
		image: img3
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'})',
		image: img4
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'})',
		image: img5
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'})',
		image: img6
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2))\n' +
			'})',
		image: img7
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2))\n' +
			'    wire("r4.out", (2,-2))\n' +
			'})',
		image: img8
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$)\n' +
			'    wire("r4.out", (2,-2))\n' +
			'})',
		image: img9
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$, label: "5V")\n' +
			'    wire("r4.out", (2,-2))\n' +
			'})',
		image: img10
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")\n' +
			'    wire("r4.out", (2,-2))\n' +
			'})',
		image: img11
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")\n' +
			'    wire("r4.out", (2,-2))\n' +
			'    npn("n1", (9,2))\n' +
			'})',
		image: img12
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")\n' +
			'    wire("r4.out", (2,-2))\n' +
			'    npn("n1", (9,2), envelope: true)\n' +
			'})',
		image: img13
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")\n' +
			'    wire("r4.out", (2,-2))\n' +
			'    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))\n' +
			'})',
		image: img14
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")\n' +
			'    wire("r4.out", (2,-2))\n' +
			'    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))\n' +
			'    wire("r1.out", "n1.b")\n' +
			'})',
		image: img15
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")\n' +
			'    wire("r4.out", (2,-2))\n' +
			'    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))\n' +
			'    wire("r1.out", "n1.b")\n' +
			'    capacitor("c1", "n1.e", (rel: (2,0)))\n' +
			'})',
		image: img16
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")\n' +
			'    wire("r4.out", (2,-2))\n' +
			'    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))\n' +
			'    wire("r1.out", "n1.b")\n' +
			'    capacitor("c1", "n1.e", (rel: (2,0)))\n' +
			'    wire("n1.c", ((), "|-", "r4.out"), "r4.out")\n' +
			'})',
		image: img17
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    wire("r1.out", (0,2))\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")\n' +
			'    wire("r4.out", (2,-2))\n' +
			'    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))\n' +
			'    wire("r1.out", "n1.b")\n' +
			'    capacitor("c1", "n1.e", (rel: (2,0)))\n' +
			'    wire("n1.c", ((), "|-", "r4.out"), "r4.out")\n' +
			'    wire("c1.out", ((), "|-", "r4.out"), "r4.out")\n' +
			'})',
		image: img18
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    afuse("f1", "r1.out", (2,2))\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")\n' +
			'    wire("r4.out", (2,-2))\n' +
			'    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))\n' +
			'    wire("r1.out", "n1.b")\n' +
			'    capacitor("c1", "n1.e", (rel: (2,0)))\n' +
			'    wire("n1.c", ((), "|-", "r4.out"), "r4.out")\n' +
			'    wire("c1.out", ((), "|-", "r4.out"), "r4.out")\n' +
			'})',
		image: img19
	},
	{
		code:
			`#import "@preview/zap:${version}"\n` +
			'\n' +
			'#zap.canvas({\n' +
			'    import zap: *\n' +
			'    \n' +
			'    resistor("r1", (2,0), (4,2))\n' +
			'    resistor("r2", (6,0), (4,2))\n' +
			'    resistor("r3", (6,0), (4,-2))\n' +
			'    resistor("r4", (2,0), (4,-2))\n' +
			'    afuse("f1", (2,2), "r1.out", position: 40%)\n' +
			'    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")\n' +
			'    wire("r4.out", (2,-2))\n' +
			'    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))\n' +
			'    wire("r1.out", "n1.b")\n' +
			'    capacitor("c1", "n1.e", (rel: (2,0)))\n' +
			'    wire("n1.c", ((), "|-", "r4.out"), "r4.out")\n' +
			'    wire("c1.out", ((), "|-", "r4.out"), "r4.out")\n' +
			'})',
		image: img20
	}
];
