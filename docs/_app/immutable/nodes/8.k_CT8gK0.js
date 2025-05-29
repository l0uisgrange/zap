import{t as g,a as l,b as k}from"../chunks/CeL0kBow.js";import{p as C,s as _,b as q,d as T,$ as N,f as h,c as i,g as Z,n as f,r as e,h as s,t as y,i as z}from"../chunks/DZ27JwdP.js";import{s as Y}from"../chunks/DuO9Kp2F.js";import{e as A,i as B}from"../chunks/DRU77Of-.js";import{h as I}from"../chunks/4TERnthZ.js";import{s as M}from"../chunks/BB3JZWZU.js";import{o as S}from"../chunks/FBymbpLG.js";import{N as j}from"../chunks/BGoqTz1n.js";import{C as D}from"../chunks/dmv2_MdM.js";import{v as E}from"../chunks/CsknK2ve.js";var F=g("<li><!></li>"),L=g(`<div class="items-stretch md:flex"><main class="min-h-dvh p-5 pt-10 md:px-8 md:py-10"><h1>Custom components</h1> <p class="max-w-2xl text-lg">For circuits demanding specialized components, Zap delivers the intuitive tools you need to easily manufacture your own.</p> <h2>Base template</h2> <p>Let's create a new component, called <span class="text-component font-mono">square</span>. Start by copying the code below into your own
			Typst project. You can already see you can use the quick <span class="text-component font-mono">component</span> and <span class="text-component font-mono">interface</span> utilities of Zap, which automatically handle wiring and positioning for you.</p> <!> <h2>Component drawing</h2> <p>Your component is now ready to be used inside your circuits! You can draw any component shapes by directly using <a target="_blank" href="https://cetz-package.github.io/docs/">CeTZ</a>. Moreover, the <span class="text-component font-mono">draw</span> function provides a set of constants to help you draw complex shapes:</p> <ul class="ms-5 block space-y-2.5"><li><span class="font-mono">ctx</span> <span class="mx-2 rounded-full bg-blue-100 px-2 py-0.5">context</span> the CeTZ drawing context, which
				you can use to resolve coordinates, strokes, etc.</li> <li><span class="font-mono">position</span> <span class="mx-2 rounded-full bg-yellow-100 px-2 py-0.5">coordinate</span> a 2d array
				representing the <span class="text-string font-mono">x</span> and <span class="text-string font-mono">y</span> values of the center coordinate</li> <li><span class="font-mono">style</span> <span class="mx-2 rounded-full bg-pink-100 px-2 py-0.5">dictionary</span> the styling attributes
				resolved with your custom <span class="text-component font-mono">style</span> constant. It also contains basic styling attributes like <span class="text-string font-mono">variant</span>, <span class="text-string font-mono">stroke</span>, <span class="text-string font-mono">fill</span>, etc.</li></ul> <p>Our <span class="text-component font-mono">square</span> component is currently represented by ... a square. We also want to be able to tune
			the square dimensions in our parameters when calling our component inside our circuits. To do this, we declare this variables inside the <span class="text-string font-mono">style</span> constant.</p> <p>The <span class="text-component font-mono">interface</span> manages the wiring, and takes the following parameters:</p> <ul class="ms-5 space-y-2.5"><li><span class="font-mono">node1</span> <span class="mx-2 rounded-full bg-yellow-100 px-2 py-0.5">coordinate</span> a 2d array representing
				your component input position, used for automatic wiring</li> <li><span class="font-mono">node2</span> <span class="mx-2 rounded-full bg-yellow-100 px-2 py-0.5">coordinate</span> a 2d array representing
				your component output position, used for automatic wiring</li> <li><span class="font-mono">io</span> <span class="rounded-full bg-green-100 px-2 py-0.5">boolean</span> fefe</li></ul></main> <div class="relative hidden w-72 flex-none p-5 md:block"><ul class="sticky top-32 block"></ul></div></div>`);function X(x,w){C(w,!0);let c=_(q([]));S(()=>{const o=document.querySelectorAll("h1, h2, h3");Z(c,Array.from(o).map((t,n)=>{const a=`heading-${n}`;return t.id=a,{level:parseInt(t.tagName.substring(1)),text:t.textContent||"",uid:a}}),!0)});var r=L();I(o=>{N.title="Custom components"});var p=i(r),v=h(i(p),8);D(v,{content:`#import "@preview/zap:${E}": component, interface, draw as d

#let square(name, node, ..params) = {
    // New component style
    let style = (
        width: 1,
		height: 1
    )
    
    // Drawing function
    let draw(ctx, position, style) = {
        interface((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), io: position.len() < 2)
        
        rect((-style.width / 2, -style.height / 2), (style.width / 2, style.height / 2), fill: white, ..style)
    }
   
    // Componant call
    component("square", name, node, draw: draw, style: style, ..params)
}`}),f(12),e(p);var m=h(p,2),d=i(m);A(d,21,()=>s(c),B,(o,t)=>{var n=F(),a=i(n);const b=z(()=>`#${s(t).uid}`);j(a,{get href(){return s(b)},children:($,O)=>{f();var u=k();y(()=>Y(u,s(t).text)),l($,u)},$$slots:{default:!0}}),e(n),y(()=>M(n,`margin-left: ${s(t).level*10}px;`)),l(o,n)}),e(d),e(m),e(r),l(x,r),T()}export{X as component};
