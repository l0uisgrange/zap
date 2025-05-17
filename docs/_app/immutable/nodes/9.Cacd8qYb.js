import{t as _,a as c,b as N}from"../chunks/DtXQzff3.js";import{p as Z,s as I,b as P,d as q,$ as A,f as o,c as a,g as G,r as e,h as r,n as L,t as y,i as T}from"../chunks/MDsmH9hs.js";import{s as j}from"../chunks/DEeQaJXw.js";import{e as B,i as D}from"../chunks/Cw5M8hkg.js";import{h as E}from"../chunks/C1EV1go8.js";import{b as M,s as R}from"../chunks/BKHdo8hb.js";import{o as U}from"../chunks/7nxS_UPl.js";import{N as V}from"../chunks/BLLzzTYW.js";import{N as Y}from"../chunks/D3WeIK71.js";import{C as b}from"../chunks/Ckq_XCQe.js";const F=""+new URL("../assets/style1.CGwDqTVL.svg",import.meta.url).href;var H=_("<li><!></li>"),J=_(`<div class="items-stretch md:flex"><main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10"><h1>Styling</h1> <p class="max-w-2xl text-lg">Zap allows you to style most electrical components using optional arguments passed
			during their declaration or simple global settings.</p> <h2>Specific component</h2> <p>If you want to customize the appearance of a <span class="font-medium">single component instance</span>, rather than all components of the same type, simply use the various <span class="text-params font-mono">params</span> optional arguments.</p> <!> <h2>Global styling</h2> <p>If you wish to change the default appearance for <span class="font-medium">all components</span> of a specific type throughout the same canvas, Zap supports the <span class="text-import font-mono">set-style</span> from CeTZ.</p> <div class="grid gap-5 lg:grid-cols-4"><img class="dark:border-neutral-border w-full rounded-lg border border-neutral-200 object-cover" alt="Style 1 example"> <div class="lg:col-span-3"><!></div></div> <h2>Style resolution</h2> <p>Zap first takes the style from the optional <span class="text-params font-mono">params</span> of your components, and merges them (with override) with the <span class="text-import font-mono">set-style</span> options.</p> <!></main> <div class="relative hidden w-72 flex-none p-5 md:block"><ul class="sticky top-32 block"></ul></div></div>`);function nt($,w){Z(w,!0);let d=I(P([]));U(()=>{const n=document.querySelectorAll("h1, h2, h3");G(d,Array.from(n).map((t,s)=>{const i=`heading-${s}`;return t.id=i,{level:parseInt(t.tagName.substring(1)),text:t.textContent||"",uid:i}}),!0)});var p=J();E(n=>{A.title="Styling"});var l=a(p),h=o(a(l),8);b(h,{content:`#zap.canvas({
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
})`}),e(f),e(m);var z=o(m,6);Y(z,{next:{href:"/zap/docs/positioning",title:"Positioning"}}),e(l);var v=o(l,2),g=a(v);B(g,21,()=>r(d),D,(n,t)=>{var s=H(),i=a(s);const S=T(()=>`#${r(t).uid}`);V(i,{get href(){return r(S)},children:(C,K)=>{L();var x=N();y(()=>j(x,r(t).text)),c(C,x)},$$slots:{default:!0}}),e(s),y(()=>R(s,`margin-left: ${r(t).level*10}px;`)),c(n,s)}),e(g),e(v),e(p),c($,p),q()}export{nt as component};
