import{t as m,a as c}from"../chunks/W0dy3kP3.js";import"../chunks/BJwYUt6x.js";import{$ as d,c as a,e as o,r as t}from"../chunks/B4kb5hSp.js";import{h as p}from"../chunks/FdDPwu-8.js";import{s as u}from"../chunks/taXoq1mL.js";import{C as v}from"../chunks/CrLx8h3l.js";const g=""+new URL("../assets/example1.DtUNQ4yC.svg",import.meta.url).href;var b=m(`<main class="block p-5 pt-10"><h1>Examples</h1> <p class="max-w-2xl text-lg">Explore the examples below to see Circuitor's advanced capabilities in action and discover
		just how easy it is to program complex circuit diagrams.</p> <div class="mt-14 grid gap-7 md:grid-cols-2"><div class="dark:border-neutral-border flex items-center justify-center overflow-hidden rounded-lg border border-neutral-200"><img alt="example1"></div> <!></div></main>`);function E(s){var r=b();p(h=>{d.title="Getting started"});var i=o(a(r),4),e=a(i),n=a(e);u(n,"src",g),t(e);var l=o(e,2);v(l,{content:`#circuitor.canvas({
    import circuitor: *

    // Branch 1
    resistor("r1", (0,3), (3,3), label: $3 Omega$)
    vsource("v1", (0,0), (0,3), label: "V1")
    resistor("r2", (0,0), (0,-3), label: $4 Omega$)

    // Branch 2
    led("l1", "r1.out", (rel: (0,-6)), label: "LED")
    inductor("i2", "r1.out", (rel: (3,0)), label: $6 mu"H"$)
    resistor("r3", "i2.out", (rel: (0,-6)), label: $2 Omega$)

    // Wiring
    wire("r2.out", "r3.out")
})`}),t(i),t(r),c(s,r)}export{E as component};
