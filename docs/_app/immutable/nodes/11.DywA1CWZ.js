import{t as _,a as c,b as N}from"../chunks/BlrYobGK.js";import{p as Z,s as I,b as q,d as A,$ as D,f as o,c as a,g as G,r as e,h as r,n as L,t as x,i as P}from"../chunks/DMj_VD0d.js";import{s as T}from"../chunks/DxafIrDU.js";import{e as j,i as B}from"../chunks/CduSz8r5.js";import{h as E}from"../chunks/R70TowAq.js";import{b as M,s as R}from"../chunks/Db0qi7NK.js";import{o as U}from"../chunks/TA8bJr9-.js";import{N as V}from"../chunks/BiCzYUDz.js";import{N as Y}from"../chunks/DtIpOXvX.js";import{C as b}from"../chunks/7h6BKf2r.js";const F=""+new URL("../assets/style1.CGwDqTVL.svg",import.meta.url).href;var H=_("<li><!></li>"),J=_(`<div class="items-stretch md:flex"><main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10"><h1>Styling</h1> <p class="max-w-2xl text-lg">Zap allows you to style most electrical components using optional arguments passed
			during their declaration or simple global settings.</p> <h2>Specific component</h2> <p>If you want to customize the appearance of a <span class="font-medium">single component instance</span>, rather than all components of the same type, simply use the various <span class="text-params font-mono">params</span> optional arguments.</p> <!> <h2>Global styling</h2> <p>If you wish to change the default appearance for <span class="font-medium">all components</span> of a specific type throughout the same canvas, Zap supports the <span class="text-import font-mono">set-style</span> from CeTZ.</p> <div class="grid gap-5 lg:grid-cols-4"><img class="dark:border-neutral-border w-full rounded-lg border border-neutral-200 object-cover" alt="Style 1 example"> <div class="lg:col-span-3"><!></div></div> <h2>Style resolution</h2> <p>Zap first takes the style from the optional <span class="text-params font-mono">params</span> of your components, and merges them (with override) with the <span class="text-import font-mono">set-style</span> options.</p> <!></main> <div class="relative hidden w-72 flex-none p-5 md:block"><ul class="sticky top-32 block"></ul></div></div>`);function nt($,w){Z(w,!0);let d=I(q([]));U(()=>{const n=document.querySelectorAll("h1, h2, h3");G(d,Array.from(n).map((t,s)=>{const i=`heading-${s}`;return t.id=i,{level:parseInt(t.tagName.substring(1)),text:t.textContent||"",uid:i}}),!0)});var p=J();E(n=>{D.title="Styling"});var l=a(p),h=o(a(l),8);b(h,{content:`#zap.canvas({
    import zap: *

    resistor("r1", (0,0), (3,0), variant: "iec", fill: red.lighten(80%), stroke: 1pt + red)
})`});var m=o(h,6),u=a(m);M(u,"src",F);var f=o(u,2),k=a(f);b(k,{content:`#zap.canvas({
    import zap: *
    set-style(zap: (
        resistor: (
            variant: "iec", 
            fill: red.lighten(80%), 
            stroke: 1pt + red
        ),
        wires: (stroke: .5pt+blue)
    ))

    // Your amazing circuit
})`}),e(f),e(m);var z=o(m,6);Y(z,{previous:{href:"/zap/docs/decorations",title:"Decorations"}}),e(l);var v=o(l,2),g=a(v);j(g,21,()=>r(d),B,(n,t)=>{var s=H(),i=a(s);const S=P(()=>`#${r(t).uid}`);V(i,{get href(){return r(S)},children:(C,K)=>{L();var y=N();x(()=>T(y,r(t).text)),c(C,y)},$$slots:{default:!0}}),e(s),x(()=>R(s,`margin-left: ${r(t).level*10}px;`)),c(n,s)}),e(g),e(v),e(p),c($,p),A()}export{nt as component};
