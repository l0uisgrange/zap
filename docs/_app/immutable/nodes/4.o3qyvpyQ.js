var Ot=Object.defineProperty;var at=e=>{throw TypeError(e)};var Pt=(e,t,n)=>t in e?Ot(e,t,{enumerable:!0,configurable:!0,writable:!0,value:n}):e[t]=n;var C=(e,t,n)=>Pt(e,typeof t!="symbol"?t+"":t,n),Nt=(e,t,n)=>t.has(e)||at("Cannot "+n);var I=(e,t,n)=>(Nt(e,t,"read from private field"),n?n.call(e):t.get(e)),lt=(e,t,n)=>t.has(e)?at("Cannot add the same private member more than once"):t instanceof WeakSet?t.add(e):t.set(e,n);import{f as U,a as D}from"../chunks/oJKTXW1w.js";import{o as Bt}from"../chunks/C-3Kyn5p.js";import{aL as Ut,k as It,v as Y,A as Ft,aN as ct,H as Vt,D as Zt,y as qt,F as ht,ac as ut,N as Q,P as gt,O as mt,q as Ht,w as Yt,aq as pt,ap as ft,aO as dt,a6 as Kt,I as Jt,l as Gt,J as X,ax as Wt,p as J,aa as yt,f as x,c as P,g as S,s as Z,n as F,r as N,d as G,j as vt,t as Rt,h as q,i as jt,b as wt,aP as Qt,$ as Xt}from"../chunks/DVT4hDLY.js";import{h as te}from"../chunks/B7ldBpxJ.js";import{c as ee,s as se,b as re}from"../chunks/KwVppFjo.js";import{c as ne,t as ie}from"../chunks/SQISEaX3.js";import{p as oe,i as bt,r as Dt,s as ae}from"../chunks/CnpKk2wc.js";import{s as le}from"../chunks/BB7nONM-.js";import{e as ce}from"../chunks/qpBUtXQW.js";import{b as he}from"../chunks/UOdeskTA.js";import{v as L}from"../chunks/BPOdOirp.js";const tt=0,K=1,et=2;function ue(e,t,n,s,r){Y&&Ft();var i=e,o=Ut(),a=Kt,l=ut,c,u,g,m=(o?gt:mt)(void 0),p=(o?gt:mt)(void 0),h=!1;function f(y,d){h=!0,d&&(pt(v),ft(v),dt(a));try{y===K&&s&&(u?Jt(u):u=Gt(()=>s(i,m))),y!==tt&&c&&X(c,()=>c=null),y!==K&&u&&X(u,()=>u=null),y!==et&&g&&X(g,()=>g=null)}finally{d&&(dt(null),ft(null),pt(null),Wt())}}var v=It(()=>{if(l===(l=t()))return;let y=Y&&ct(l)===(i.data===Vt);if(y&&(i=Zt(),qt(i),ht(!1),y=!0),ct(l)){var d=l;h=!1,d.then(w=>{d===l&&(Q(m,w),f(K,!0))},w=>{if(d===l)throw Q(p,w),f(et,!0),p.v}),Y||Ht(()=>{h||f(tt,!0)})}else Q(m,l),f(K,!1);return y&&ht(!0),()=>l=ut});Y&&(i=Yt)}const ge=Object.freeze({diffTimeout:1,diffEditCost:4,matchThreshold:.5,matchDistance:1e3,patchDeleteThreshold:.5,patchMargin:4,matchMaxBits:32});function me(e){if(e!=null&&e.__resolved)return e;const t={...ge,...e};return Object.defineProperty(t,"__resolved",{value:!0,enumerable:!1}),t}const A=-1,M=1,z=0;function k(e,t){return[e,t]}function R(e,t,n,s=!0,r){const i=me(n);typeof r>"u"&&(i.diffTimeout<=0?r=Number.MAX_VALUE:r=new Date().getTime()+i.diffTimeout*1e3);const o=r;if(e==null||t==null)throw new Error("Null input. (diff_main)");if(e===t)return e?[k(z,e)]:[];const a=s;let l=it(e,t);const c=e.substring(0,l);e=e.substring(l),t=t.substring(l),l=W(e,t);const u=e.substring(e.length-l);e=e.substring(0,e.length-l),t=t.substring(0,t.length-l);const g=pe(e,t,i,a,o);return c&&g.unshift(k(z,c)),u&&g.push(k(z,u)),ot(g),g}function pe(e,t,n,s,r){let i;if(!e)return[k(M,t)];if(!t)return[k(A,e)];const o=e.length>t.length?e:t,a=e.length>t.length?t:e,l=o.indexOf(a);if(l!==-1)return i=[k(M,o.substring(0,l)),k(z,a),k(M,o.substring(l+a.length))],e.length>t.length&&(i[0][0]=i[2][0]=A),i;if(a.length===1)return[k(A,e),k(M,t)];const c=we(e,t,n);if(c){const u=c[0],g=c[1],m=c[2],p=c[3],h=c[4],f=R(u,m,n,s,r),v=R(g,p,n,s,r);return f.concat([k(z,h)],v)}return s&&e.length>100&&t.length>100?fe(e,t,n,r):de(e,t,n,r)}function fe(e,t,n,s){const r=ye(e,t);e=r.chars1,t=r.chars2;const i=r.lineArray,o=R(e,t,n,!1,s);ve(o,i),be(o),o.push(k(z,""));let a=0,l=0,c=0,u="",g="";for(;a<o.length;){switch(o[a][0]){case M:c++,g+=o[a][1];break;case A:l++,u+=o[a][1];break;case z:if(l>=1&&c>=1){o.splice(a-l-c,l+c),a=a-l-c;const m=R(u,g,n,!1,s);for(let p=m.length-1;p>=0;p--)o.splice(a,0,m[p]);a=a+m.length}c=0,l=0,u="",g="";break}a++}return o.pop(),o}function de(e,t,n,s){const r=e.length,i=t.length,o=Math.ceil((r+i)/2),a=o,l=2*o,c=new Array(l),u=new Array(l);for(let y=0;y<l;y++)c[y]=-1,u[y]=-1;c[a+1]=0,u[a+1]=0;const g=r-i,m=g%2!==0;let p=0,h=0,f=0,v=0;for(let y=0;y<o&&!(new Date().getTime()>s);y++){for(let d=-y+p;d<=y-h;d+=2){const w=a+d;let b;d===-y||d!==y&&c[w-1]<c[w+1]?b=c[w+1]:b=c[w-1]+1;let _=b-d;for(;b<r&&_<i&&e.charAt(b)===t.charAt(_);)b++,_++;if(c[w]=b,b>r)h+=2;else if(_>i)p+=2;else if(m){const $=a+g-d;if($>=0&&$<l&&u[$]!==-1){const T=r-u[$];if(b>=T)return _t(e,t,n,b,_,s)}}}for(let d=-y+f;d<=y-v;d+=2){const w=a+d;let b;d===-y||d!==y&&u[w-1]<u[w+1]?b=u[w+1]:b=u[w-1]+1;let _=b-d;for(;b<r&&_<i&&e.charAt(r-b-1)===t.charAt(i-_-1);)b++,_++;if(u[w]=b,b>r)v+=2;else if(_>i)f+=2;else if(!m){const $=a+g-d;if($>=0&&$<l&&c[$]!==-1){const T=c[$],j=a+T-$;if(b=r-b,T>=b)return _t(e,t,n,T,j,s)}}}}return[k(A,e),k(M,t)]}function _t(e,t,n,s,r,i){const o=e.substring(0,s),a=t.substring(0,r),l=e.substring(s),c=t.substring(r),u=R(o,a,n,!1,i),g=R(l,c,n,!1,i);return u.concat(g)}function ye(e,t){const n=[],s={};let r=4e4;n[0]="";function i(l){let c="",u=0,g=-1,m=n.length;for(;g<l.length-1;){g=l.indexOf(`
`,u),g===-1&&(g=l.length-1);let p=l.substring(u,g+1);(s.hasOwnProperty?Object.prototype.hasOwnProperty.call(s,p):s[p]!==void 0)?c+=String.fromCharCode(s[p]):(m===r&&(p=l.substring(u),g=l.length),c+=String.fromCharCode(m),s[p]=m,n[m++]=p),u=g+1}return c}const o=i(e);r=65535;const a=i(t);return{chars1:o,chars2:a,lineArray:n}}function ve(e,t){for(let n=0;n<e.length;n++){const s=e[n][1],r=[];for(let i=0;i<s.length;i++)r[i]=t[s.charCodeAt(i)];e[n][1]=r.join("")}}function it(e,t){if(!e||!t||e.charAt(0)!==t.charAt(0))return 0;let n=0,s=Math.min(e.length,t.length),r=s,i=0;for(;n<r;)e.substring(i,r)===t.substring(i,r)?(n=r,i=n):s=r,r=Math.floor((s-n)/2+n);return r}function W(e,t){if(!e||!t||e.charAt(e.length-1)!==t.charAt(t.length-1))return 0;let n=0,s=Math.min(e.length,t.length),r=s,i=0;for(;n<r;)e.substring(e.length-r,e.length-i)===t.substring(t.length-r,t.length-i)?(n=r,i=n):s=r,r=Math.floor((s-n)/2+n);return r}function kt(e,t){const n=e.length,s=t.length;if(n===0||s===0)return 0;n>s?e=e.substring(n-s):n<s&&(t=t.substring(0,n));const r=Math.min(n,s);if(e===t)return r;let i=0,o=1;for(;;){const a=e.substring(r-o),l=t.indexOf(a);if(l===-1)return i;o+=l,(l===0||e.substring(r-o)===t.substring(0,o))&&(i=o,o++)}}function we(e,t,n){if(n.diffTimeout<=0)return null;const s=e.length>t.length?e:t,r=e.length>t.length?t:e;if(s.length<4||r.length*2<s.length)return null;function i(h,f,v){const y=h.substring(v,v+Math.floor(h.length/4));let d=-1,w="",b,_,$,T;for(;(d=f.indexOf(y,d+1))!==-1;){const j=it(h.substring(v),f.substring(d)),H=W(h.substring(0,v),f.substring(0,d));w.length<H+j&&(w=f.substring(d-H,d)+f.substring(d,d+j),b=h.substring(0,v-H),_=h.substring(v+j),$=f.substring(0,d-H),T=f.substring(d+j))}return w.length*2>=h.length?[b,_,$,T,w]:null}const o=i(s,r,Math.ceil(s.length/4)),a=i(s,r,Math.ceil(s.length/2));let l;if(!o&&!a)return null;a?o?l=o[4].length>a[4].length?o:a:l=a:l=o;let c,u,g,m;e.length>t.length?(c=l[0],u=l[1],g=l[2],m=l[3]):(g=l[0],m=l[1],c=l[2],u=l[3]);const p=l[4];return[c,u,g,m,p]}function be(e){let t=!1;const n=[];let s=0,r=null,i=0,o=0,a=0,l=0,c=0;for(;i<e.length;)e[i][0]===z?(n[s++]=i,o=l,a=c,l=0,c=0,r=e[i][1]):(e[i][0]===M?l+=e[i][1].length:c+=e[i][1].length,r&&r.length<=Math.max(o,a)&&r.length<=Math.max(l,c)&&(e.splice(n[s-1],0,k(A,r)),e[n[s-1]+1][0]=M,s--,s--,i=s>0?n[s-1]:-1,o=0,a=0,l=0,c=0,r=null,t=!0)),i++;for(t&&ot(e),Le(e),i=1;i<e.length;){if(e[i-1][0]===A&&e[i][0]===M){const u=e[i-1][1],g=e[i][1],m=kt(u,g),p=kt(g,u);m>=p?(m>=u.length/2||m>=g.length/2)&&(e.splice(i,0,k(z,g.substring(0,m))),e[i-1][1]=u.substring(0,u.length-m),e[i+1][1]=g.substring(m),i++):(p>=u.length/2||p>=g.length/2)&&(e.splice(i,0,k(z,u.substring(0,p))),e[i-1][0]=M,e[i-1][1]=g.substring(0,g.length-p),e[i+1][0]=A,e[i+1][1]=u.substring(p),i++),i++}i++}}const Lt=/[^a-z0-9]/i,zt=/\s/,$t=/[\r\n]/,_e=/\n\r?\n$/,ke=/^\r?\n\r?\n/;function Le(e){function t(s,r){if(!s||!r)return 6;const i=s.charAt(s.length-1),o=r.charAt(0),a=i.match(Lt),l=o.match(Lt),c=a&&i.match(zt),u=l&&o.match(zt),g=c&&i.match($t),m=u&&o.match($t),p=g&&s.match(_e),h=m&&r.match(ke);return p||h?5:g||m?4:a&&!c&&u?3:c||u?2:a||l?1:0}let n=1;for(;n<e.length-1;){if(e[n-1][0]===z&&e[n+1][0]===z){let s=e[n-1][1],r=e[n][1],i=e[n+1][1];const o=W(s,r);if(o){const g=r.substring(r.length-o);s=s.substring(0,s.length-o),r=g+r.substring(0,r.length-o),i=g+i}let a=s,l=r,c=i,u=t(s,r)+t(r,i);for(;r.charAt(0)===i.charAt(0);){s+=r.charAt(0),r=r.substring(1)+i.charAt(0),i=i.substring(1);const g=t(s,r)+t(r,i);g>=u&&(u=g,a=s,l=r,c=i)}e[n-1][1]!==a&&(a?e[n-1][1]=a:(e.splice(n-1,1),n--),e[n][1]=l,c?e[n+1][1]=c:(e.splice(n+1,1),n--))}n++}}function ot(e){e.push(k(z,""));let t=0,n=0,s=0,r="",i="",o;for(;t<e.length;)switch(e[t][0]){case M:s++,i+=e[t][1],t++;break;case A:n++,r+=e[t][1],t++;break;case z:n+s>1?(n!==0&&s!==0&&(o=it(i,r),o!==0&&(t-n-s>0&&e[t-n-s-1][0]===z?e[t-n-s-1][1]+=i.substring(0,o):(e.splice(0,0,k(z,i.substring(0,o))),t++),i=i.substring(o),r=r.substring(o)),o=W(i,r),o!==0&&(e[t][1]=i.substring(i.length-o)+e[t][1],i=i.substring(0,i.length-o),r=r.substring(0,r.length-o))),t-=n+s,e.splice(t,n+s),r.length&&(e.splice(t,0,k(A,r)),t++),i.length&&(e.splice(t,0,k(M,i)),t++),t++):t!==0&&e[t-1][0]===z?(e[t-1][1]+=e[t][1],e.splice(t,1)):t++,s=0,n=0,r="",i="";break}e[e.length-1][1]===""&&e.pop();let a=!1;for(t=1;t<e.length-1;)e[t-1][0]===z&&e[t+1][0]===z&&(e[t][1].substring(e[t][1].length-e[t-1][1].length)===e[t-1][1]?(e[t][1]=e[t-1][1]+e[t][1].substring(0,e[t][1].length-e[t-1][1].length),e[t+1][1]=e[t-1][1]+e[t+1][1],e.splice(t-1,1),a=!0):e[t][1].substring(0,e[t+1][1].length)===e[t+1][1]&&(e[t-1][1]+=e[t+1][1],e[t][1]=e[t][1].substring(e[t+1][1].length)+e[t+1][1],e.splice(t+1,1),a=!0)),t++;a&&ot(e)}function ze(e){return typeof e=="string"?`'${e}'`:new $e().serialize(e)}const $e=function(){var t;class e{constructor(){lt(this,t,new Map)}compare(s,r){const i=typeof s,o=typeof r;return i==="string"&&o==="string"?s.localeCompare(r):i==="number"&&o==="number"?s-r:String.prototype.localeCompare.call(this.serialize(s,!0),this.serialize(r,!0))}serialize(s,r){if(s===null)return"null";switch(typeof s){case"string":return r?s:`'${s}'`;case"bigint":return`${s}n`;case"object":return this.$object(s);case"function":return this.$function(s)}return String(s)}serializeObject(s){const r=Object.prototype.toString.call(s);if(r!=="[object Object]")return this.serializeBuiltInType(r.length<10?`unknown:${r}`:r.slice(8,-1),s);const i=s.constructor,o=i===Object||i===void 0?"":i.name;if(o!==""&&globalThis[o]===i)return this.serializeBuiltInType(o,s);if(typeof s.toJSON=="function"){const a=s.toJSON();return o+(a!==null&&typeof a=="object"?this.$object(a):`(${this.serialize(a)})`)}return this.serializeObjectEntries(o,Object.entries(s))}serializeBuiltInType(s,r){const i=this["$"+s];if(i)return i.call(this,r);if(typeof(r==null?void 0:r.entries)=="function")return this.serializeObjectEntries(s,r.entries());throw new Error(`Cannot serialize ${s}`)}serializeObjectEntries(s,r){const i=Array.from(r).sort((a,l)=>this.compare(a[0],l[0]));let o=`${s}{`;for(let a=0;a<i.length;a++){const[l,c]=i[a];o+=`${this.serialize(l,!0)}:${this.serialize(c)}`,a<i.length-1&&(o+=",")}return o+"}"}$object(s){let r=I(this,t).get(s);return r===void 0&&(I(this,t).set(s,`#${I(this,t).size}`),r=this.serializeObject(s),I(this,t).set(s,r)),r}$function(s){const r=Function.prototype.toString.call(s);return r.slice(-15)==="[native code] }"?`${s.name||""}()[native]`:`${s.name}(${s.length})${r.replace(/\s*\n\s*/g,"")}`}$Array(s){let r="[";for(let i=0;i<s.length;i++)r+=this.serialize(s[i]),i<s.length-1&&(r+=",");return r+"]"}$Date(s){try{return`Date(${s.toISOString()})`}catch{return"Date(null)"}}$ArrayBuffer(s){return`ArrayBuffer[${new Uint8Array(s).join(",")}]`}$Set(s){return`Set${this.$Array(Array.from(s).sort((r,i)=>this.compare(r,i)))}`}$Map(s){return this.serializeObjectEntries("Map",s.entries())}}t=new WeakMap;for(const n of["Error","RegExp","URL"])e.prototype["$"+n]=function(s){return`${n}(${s})`};for(const n of["Int8Array","Uint8Array","Uint8ClampedArray","Int16Array","Uint16Array","Int32Array","Uint32Array","Float32Array","Float64Array"])e.prototype["$"+n]=function(s){return`${n}[${s.join(",")}]`};for(const n of["BigInt64Array","BigUint64Array"])e.prototype["$"+n]=function(s){return`${n}[${s.join("n,")}${s.length>0?"n":""}]`};return e}(),Se=[1779033703,-1150833019,1013904242,-1521486534,1359893119,-1694144372,528734635,1541459225],Me=[1116352408,1899447441,-1245643825,-373957723,961987163,1508970993,-1841331548,-1424204075,-670586216,310598401,607225278,1426881987,1925078388,-2132889090,-1680079193,-1046744716,-459576895,-272742522,264347078,604807628,770255983,1249150122,1555081692,1996064986,-1740746414,-1473132947,-1341970488,-1084653625,-958395405,-710438585,113926993,338241895,666307205,773529912,1294757372,1396182291,1695183700,1986661051,-2117940946,-1838011259,-1564481375,-1474664885,-1035236496,-949202525,-778901479,-694614492,-200395387,275423344,430227734,506948616,659060556,883997877,958139571,1322822218,1537002063,1747873779,1955562222,2024104815,-2067236844,-1933114872,-1866530822,-1538233109,-1090935817,-965641998],Ee="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_",B=[];class Ce{constructor(){C(this,"_data",new O);C(this,"_hash",new O([...Se]));C(this,"_nDataBytes",0);C(this,"_minBufferSize",0)}finalize(t){t&&this._append(t);const n=this._nDataBytes*8,s=this._data.sigBytes*8;return this._data.words[s>>>5]|=128<<24-s%32,this._data.words[(s+64>>>9<<4)+14]=Math.floor(n/4294967296),this._data.words[(s+64>>>9<<4)+15]=n,this._data.sigBytes=this._data.words.length*4,this._process(),this._hash}_doProcessBlock(t,n){const s=this._hash.words;let r=s[0],i=s[1],o=s[2],a=s[3],l=s[4],c=s[5],u=s[6],g=s[7];for(let m=0;m<64;m++){if(m<16)B[m]=t[n+m]|0;else{const w=B[m-15],b=(w<<25|w>>>7)^(w<<14|w>>>18)^w>>>3,_=B[m-2],$=(_<<15|_>>>17)^(_<<13|_>>>19)^_>>>10;B[m]=b+B[m-7]+$+B[m-16]}const p=l&c^~l&u,h=r&i^r&o^i&o,f=(r<<30|r>>>2)^(r<<19|r>>>13)^(r<<10|r>>>22),v=(l<<26|l>>>6)^(l<<21|l>>>11)^(l<<7|l>>>25),y=g+v+p+Me[m]+B[m],d=f+h;g=u,u=c,c=l,l=a+y|0,a=o,o=i,i=r,r=y+d|0}s[0]=s[0]+r|0,s[1]=s[1]+i|0,s[2]=s[2]+o|0,s[3]=s[3]+a|0,s[4]=s[4]+l|0,s[5]=s[5]+c|0,s[6]=s[6]+u|0,s[7]=s[7]+g|0}_append(t){typeof t=="string"&&(t=O.fromUtf8(t)),this._data.concat(t),this._nDataBytes+=t.sigBytes}_process(t){let n,s=this._data.sigBytes/64;t?s=Math.ceil(s):s=Math.max((s|0)-this._minBufferSize,0);const r=s*16,i=Math.min(r*4,this._data.sigBytes);if(r){for(let o=0;o<r;o+=16)this._doProcessBlock(this._data.words,o);n=this._data.words.splice(0,r),this._data.sigBytes-=i}return new O(n,i)}}class O{constructor(t,n){C(this,"words");C(this,"sigBytes");t=this.words=t||[],this.sigBytes=n===void 0?t.length*4:n}static fromUtf8(t){const n=unescape(encodeURIComponent(t)),s=n.length,r=[];for(let i=0;i<s;i++)r[i>>>2]|=(n.charCodeAt(i)&255)<<24-i%4*8;return new O(r,s)}toBase64(){const t=[];for(let n=0;n<this.sigBytes;n+=3){const s=this.words[n>>>2]>>>24-n%4*8&255,r=this.words[n+1>>>2]>>>24-(n+1)%4*8&255,i=this.words[n+2>>>2]>>>24-(n+2)%4*8&255,o=s<<16|r<<8|i;for(let a=0;a<4&&n*8+a*6<this.sigBytes*8;a++)t.push(Ee.charAt(o>>>6*(3-a)&63))}return t.join("")}concat(t){if(this.words[this.sigBytes>>>2]&=4294967295<<32-this.sigBytes%4*8,this.words.length=Math.ceil(this.sigBytes/4),this.sigBytes%4)for(let n=0;n<t.sigBytes;n++){const s=t.words[n>>>2]>>>24-n%4*8&255;this.words[this.sigBytes+n>>>2]|=s<<24-(this.sigBytes+n)%4*8}else for(let n=0;n<t.sigBytes;n+=4)this.words[this.sigBytes+n>>>2]=t.words[n>>>2];this.sigBytes+=t.sigBytes}}function Ae(e){return new Ce().finalize(e).toBase64()}function Te(e){return Ae(ze(e))}function Be(e,t={}){const n=xt("",[]);let s=n,r=n;function i(o,a){s=r;const l=a?{...t,...a}:t,c=e(o,l.lineNumbers);return{from:s,to:r}=xe(s,c,l),{current:r,previous:s}}return{get current(){return r},get previous(){return s},commit:i,reset(){s=n,r=n}}}function Re(e,t,n,s=!1){const r=e.codeToTokens(t,n);return{...xt(t,r.tokens,JSON.stringify([n.lang,"themes"in n?n.themes:n.theme]),s),bg:r.bg,fg:r.fg,rootStyle:r.rootStyle,themeName:r.themeName,lang:n.lang}}function xt(e,t,n="",s=!1){const r=Te(e+n);let i=0,o=0;const a=Math.ceil(Math.log10(t.length)),l=je(t).flatMap((c,u)=>{var p;o=((p=c[0])==null?void 0:p.offset)||i;const g=c[c.length-1];g?i=g.offset+g.content.length:i+=1;const m=[...c,{content:`
`,offset:i}];return s&&m.unshift({key:`${r}-ln-${u+1}`,content:`${String(u+1).padStart(a," ")}  `,offset:o,htmlClass:"shiki-magic-move-line-number"}),m}).map((c,u)=>{const g=c;return g.key||(g.key=`${r}-${u}`),g});return{code:e,hash:r,tokens:l,lineNumbers:s}}function je(e){return e.map(t=>t.flatMap(n=>{if(n.content.match(/^\s+$/))return n;const s=n.content.match(/^(\s*)(.*?)(\s*)$/);if(!s)return n;const[,r,i,o]=s;if(!r&&!o)return n;const a=[{...n,offset:n.offset+r.length,content:i}];return r&&a.unshift({content:r,offset:n.offset}),o&&a.push({content:o,offset:n.offset+r.length+i.length}),a}))}function De(e,t){let n=0;const s=e.key;let r=0;const i=[];function o(){return r===0?(r++,s):`${s}-${r++}`}for(const a of t)a>n&&i.push({...e,content:e.content.slice(n,a),offset:e.offset+n,key:o()}),n=a;return n<e.content.length&&i.push({...e,content:e.content.slice(n),offset:e.offset+n,key:o()}),i}function St(e,t){const n=Array.from(t instanceof Set?t:new Set(t)).sort((s,r)=>s-r);return n.length?e.flatMap(s=>{const r=n.filter(i=>s.offset<i&&i<s.offset+s.content.length).map(i=>i-s.offset).sort((i,o)=>i-o);return r.length?De(s,r):s}):e}function xe(e,t,n={}){const{splitTokens:s=!1,enhanceMatching:r=!0}=n,i=Oe(e.code,t.code,n),o=s?St(e.tokens,i.flatMap(c=>c.from)):e.tokens,a=s?St(t.tokens,i.flatMap(c=>c.to)):t.tokens,l=new Set;if(i.forEach(c=>{var h,f;const u=o.filter(v=>v.offset>=c.from[0]&&v.offset+v.content.length<=c.from[1]),g=a.filter(v=>v.offset>=c.to[0]&&v.offset+v.content.length<=c.to[1]);let m=0,p=0;for(;m<u.length&&p<g.length&&!(!u[m]||!g[p]);)u[m].content===g[p].content?(g[p].key=u[m].key,l.add(u[m].key),m++,p++):((h=u[m+1])==null?void 0:h.content)===g[p].content?m++:(u[m].content===((f=g[p+1])==null?void 0:f.content)||m++,p++)}),r)for(const c of o){if(l.has(c.key)||c.content.length<3||!c.content.match(/^[\w-]+$/))continue;const u=a.find(g=>g.content===c.content&&!l.has(g.key));u&&(u.key=c.key,l.add(c.key))}return{from:o.length===e.tokens.length?e:{...e,tokens:o},to:a.length===t.tokens.length?t:{...t,tokens:a}}}function Oe(e,t,n={}){var a;let s=R(e,t);s=((a=n.diffCleanup)==null?void 0:a.call(n,s))||s;let r="",i="";const o=[];for(const[l,c]of s)l===0?(o.push({from:[r.length,r.length+c.length],to:[i.length,i.length+c.length],content:c}),r+=c,i+=c):l===-1?r+=c:l===1&&(i+=c);if(r!==e||i!==t)throw new Error("Content mismatch");return o}const E="shiki-magic-move",st=`${E}-leave-from`,Pe=`${E}-leave-to`,Mt=`${E}-leave-active`,rt=`${E}-enter-from`,nt=`${E}-enter-to`,Et=`${E}-enter-active`,Ct=`${E}-move`,At=`${E}-container-resize`,Tt=`${E}-container-restyle`,Ne={globalScale:1,duration:500,delayMove:.3,delayLeave:.1,delayEnter:.7,delayContainer:.4,stagger:0,easing:"ease",animateContainer:!0,containerStyle:!0};class Ue{constructor(t,n={}){C(this,"mapDom",new Map);C(this,"previousPromises",[]);C(this,"isFirstRender",!0);this.options={...Ne,...n},typeof t=="string"?this.container=document.querySelector(t):this.container=t,this.anchor=document.createElement("span"),this.anchor.style.position="absolute",this.anchor.style.top="0",this.anchor.style.left="0",this.anchor.style.height="1px",this.anchor.style.width="1px",this.container.prepend(this.anchor)}applyElementContent(t,n){n.content!==`
`&&(t.textContent=n.content,t.classList.add(`${E}-item`))}applyElementStyle(t,n){if(n.htmlStyle)if(typeof n.htmlStyle=="string")t.setAttribute("style",n.htmlStyle);else for(const[s,r]of Object.entries(n.htmlStyle))t.style.setProperty(s,r);n.htmlClass&&(t.className=[`${E}-item`,n.htmlClass].join(" ")),n.color&&(t.style.color=n.color),n.bgColor&&(t.style.backgroundColor=n.bgColor)}applyElement(t,n){this.applyElementContent(t,n),this.applyElementStyle(t,n)}applyNodeStyle(t,n){if(n.bg&&(t.style.backgroundColor=n.bg),n.fg&&(t.style.color=n.fg),n.rootStyle){const s=n.rootStyle.split(";");for(const r of s){const[i,o]=r.split(":");i&&o&&t.style.setProperty(i.trim(),o.trim())}}}applyContainerStyle(t){this.options.containerStyle&&this.applyNodeStyle(this.container,t)}registerTransitionEnd(t,n){return()=>{let s=!1,r=()=>{};const i=Promise.race([Promise.allSettled(t.getAnimations().map(o=>o.finished)).then(()=>n()),new Promise(o=>{r=()=>{s||(s=!0,n(),o())}})]);return i.resolve=r,i}}setCssVariables(){this.container.style.setProperty("--smm-duration",`${this.options.duration}ms`),this.container.style.setProperty("--smm-delay-move",`${this.options.delayMove}`),this.container.style.setProperty("--smm-delay-leave",`${this.options.delayLeave}`),this.container.style.setProperty("--smm-delay-enter",`${this.options.delayEnter}`),this.container.style.setProperty("--smm-delay-container",`${this.options.delayContainer}`),this.container.style.setProperty("--smm-easing",this.options.easing),this.container.style.setProperty("--smm-stagger","0")}replace(t){const n=new Map,s=t.tokens.map(r=>{if(this.mapDom.has(r.key)){const i=this.mapDom.get(r.key);return this.applyElement(i,r),n.set(r.key,i),this.mapDom.delete(r.key),i}else{const i=document.createElement(r.content===`
`?"br":"span");return this.applyElement(i,r),n.set(r.key,i),i}});this.container.replaceChildren(this.anchor,...s),this.applyContainerStyle(t),this.mapDom=n}render(t){this.setCssVariables();const n=new Map,s=[],r=[],i=[],o=[];this.previousPromises.forEach(h=>h.resolve()),this.previousPromises=[];const a=[],{globalScale:l}=this.options,c=new Map;let u=this.anchor.getBoundingClientRect();const g=this.container.getBoundingClientRect();for(const h of this.mapDom.values()){const f=h.getBoundingClientRect();c.set(h,{x:f.x-u.x,y:f.y-u.y})}const m=t.tokens.map(h=>{if(this.mapDom.has(h.key)){const f=this.mapDom.get(h.key);return this.applyElementContent(f,h),a.push(()=>{this.applyElementStyle(f,h)}),s.push(f),n.set(h.key,f),this.mapDom.delete(h.key),f}else{const f=document.createElement(h.content===`
`?"br":"span");return this.applyElement(f,h),r.push(f),n.set(h.key,f),f}});for(const[h,f]of this.mapDom)f.tagName!=="BR"&&i.push(f);for(const h of i)h.style.position="absolute";if(this.container.replaceChildren(this.anchor,...m,...i),this.mapDom=n,i.forEach((h,f)=>{h.style.position="absolute";const v=c.get(h);h.style.top=`${v.y/l}px`,h.style.left=`${v.x/l}px`,this.options.stagger?h.style.setProperty("--smm-stagger",`${f*this.options.stagger}ms`):h.style.removeProperty("--smm-stagger"),h.classList.add(st),h.classList.add(Mt),a.unshift(()=>{h.classList.remove(st),h.classList.add(Pe)}),o.push(this.registerTransitionEnd(h,()=>{h.classList.remove(st),h.classList.remove(Mt),h.classList.remove(nt),h.remove()}))}),this.isFirstRender||r.forEach((h,f)=>{h.classList.add(rt),h.classList.add(Et),this.options.stagger?h.style.setProperty("--smm-stagger",`${f*this.options.stagger}ms`):h.style.removeProperty("--smm-stagger"),a.push(()=>{h.classList.remove(rt),h.classList.add(nt)}),o.push(this.registerTransitionEnd(h,()=>{h.classList.remove(rt),h.classList.remove(Et),h.classList.remove(nt)}))}),u=this.anchor.getBoundingClientRect(),s.forEach((h,f)=>{const v=h.getBoundingClientRect(),y={x:v.x-u.x,y:v.y-u.y},d=c.get(h);h.style.transitionDuration=h.style.transitionDelay="0ms";const w=(d.x-y.x)/l,b=(d.y-y.y)/l;h.style.transform=`translate(${w}px, ${b}px)`,this.options.stagger?h.style.setProperty("--smm-stagger",`${f*this.options.stagger}ms`):h.style.removeProperty("--smm-stagger"),a.unshift(()=>{h.classList.add(Ct),h.style.transform=h.style.transitionDuration=h.style.transitionDelay=""}),o.push(this.registerTransitionEnd(h,()=>{h.classList.remove(Ct)}))}),this.options.animateContainer&&!this.isFirstRender){const h=this.container.getBoundingClientRect();(h.width!==g.width||h.height!==g.height)&&(this.container.style.transitionDuration=this.container.style.transitionDelay="0ms",this.container.style.height=`${g.height/l}px`,this.container.style.width=`${g.width/l}px`,a.unshift(()=>{this.container.classList.add(At),this.container.style.transitionDuration=this.container.style.transitionDelay="",this.container.style.height=`${h.height/l}px`,this.container.style.width=`${h.width/l}px`}),o.push(this.registerTransitionEnd(this.container,()=>{this.container.classList.remove(At),this.container.style.height=this.container.style.width=""})))}this.options.containerStyle&&(this.isFirstRender?this.applyContainerStyle(t):(a.push(()=>{this.container.classList.add(Tt),this.applyContainerStyle(t)}),o.push(this.registerTransitionEnd(this.container,()=>{this.container.classList.remove(Tt)})))),Ie(),a.forEach(h=>h());const p=o.map(h=>h());return this.isFirstRender=!1,this.previousPromises=p,Promise.all(p).then()}}function Ie(){return document.body.offsetHeight}var Fe=U(`
        <br/>
      `,1),Ve=U(`
      <!>
      <span class="shiki-magic-move-item"> </span>
    `,1),Ze=U(`
    <!>
  `,1),qe=U(`<pre>
  
  <!>
</pre>`);function He(e,t){J(t,!0);const n=oe(t,"animate",3,!0),s=Dt(t,["$$slots","$$events","$$legacy","animate","tokens","previous","options","onStart","onEnd"]);let r,i,o=Z(!1);yt(()=>{r&&(r.innerHTML="",q(o,!0),i=new Ue(r))}),yt(()=>{async function u(){var g,m;i&&(Object.assign(i.options,t.options),n()?(t.previous&&i.replace(t.previous),(g=t.onStart)==null||g.call(t),await i.render(t.tokens),(m=t.onEnd)==null||m.call(t)):i.replace(t.tokens))}u()});var a=qe();ee(a,()=>({class:`shiki-magic-move-container ${(t==null?void 0:t.class)??""}`,...s}));var l=x(P(a));{var c=u=>{var g=Ze(),m=x(vt(g));ce(m,17,()=>t.tokens.tokens,p=>p.key,(p,h)=>{F();var f=Ve(),v=x(vt(f));{var y=_=>{var $=Fe();F(2),D(_,$)};bt(v,_=>{S(h).content===`
`&&_(y)})}var d=x(v,2);let w;var b=P(d);N(d),F(),Rt(()=>{w=se(d,S(h).htmlStyle,w,{color:S(h).color}),le(b,`
        ${S(h).content??""}
      `)}),D(p,f)}),F(),D(u,g)};bt(l,u=>{S(o)||u(c)})}F(),N(a),he(a,u=>r=u,()=>r),D(e,a),G()}function Ye(e,t){J(t,!0);const n=Dt(t,["$$slots","$$events","$$legacy","highlighter","lang","theme","code","options","onStart","onEnd"]),s=Be(i=>{var o;return Re(t.highlighter,i,{lang:t.lang,theme:t.theme},(o=t.options)==null?void 0:o.lineNumbers)},t.options),r=jt(()=>s.commit(t.code));He(e,ae({get tokens(){return S(r).current},get previous(){return S(r).previous},get options(){return t.options},get onStart(){return t.onStart},get onEnd(){return t.onEnd}},()=>n)),G()}var Ke=U('<div class="mb-2 block w-full max-w-full overflow-x-auto rounded-xl bg-neutral-100 px-4 py-3 text-base text-[15px] ring-1 ring-gray-200 ring-offset-2 ring-offset-neutral-100 ring-inset dark:bg-neutral-800 dark:ring-gray-800 dark:ring-offset-neutral-800"><!></div>');function Je(e,t){J(t,!0);const n=ne({themes:["github-dark-default","github-light-default"],langs:[ie]});let s=Z(!1);Bt(async()=>{const o=window.matchMedia("(prefers-color-scheme: dark)");q(s,o.matches,!0),o.addEventListener("change",a=>{q(s,a.matches,!0)})});var r=Ke(),i=P(r);ue(i,()=>n,null,(o,a)=>{const l=jt(()=>S(s)?"github-dark-default":"github-light-default");Ye(o,{lang:"typst",get theme(){return S(l)},get highlighter(){return S(a)},get code(){return t.code},options:{duration:100,stagger:.1}})}),N(r),D(e,r),G()}const Ge="data:image/svg+xml,%3csvg%20class='typst-doc'%20viewBox='0%200%2049.96850393700788%2023.322834645669293'%20width='49.96850393700788pt'%20height='23.322834645669293pt'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%20xmlns:h5='http://www.w3.org/1999/xhtml'%3e%3cpath%20class='typst-shape'%20fill='%23ffffff'%20fill-rule='nonzero'%20d='M%200%200%20L%200%2023.322834%20L%2049.968502%2023.322834%20L%2049.968502%200%20Z%20'/%3e%3cg%3e%3cg%20transform='translate(5%205)'%3e%3cg%20class='typst-group'%3e%3cg%3e%3cg%20transform='translate(0%200)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.8'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%200%200%20L%200%2013.322835%20L%2039.968502%2013.322835%20L%2039.968502%200%20L%200%200%20Z%20'/%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/svg%3e",We="data:image/svg+xml,%3csvg%20class='typst-doc'%20viewBox='0%200%2066.69291338582677%2066.69291338582676'%20width='66.69291338582677pt'%20height='66.69291338582676pt'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%20xmlns:h5='http://www.w3.org/1999/xhtml'%3e%3cpath%20class='typst-shape'%20fill='%23ffffff'%20fill-rule='nonzero'%20d='M%200%200%20L%200%2066.69292%20L%2066.69292%2066.69292%20L%2066.69292%200%20Z%20'/%3e%3cg%3e%3cg%20transform='translate(5%205)'%3e%3cg%20class='typst-group'%3e%3cg%3e%3cg%20transform='translate(0%2042.47745675307086)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%200%2014.215457%20L%2014.215457%200%20'/%3e%3c/g%3e%3cg%20transform='translate(42.47745675307083%200)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%2014.215457%200%20L%200%2014.215457%20'/%3e%3c/g%3e%3cg%20transform='translate(9.50512301432204%209.505123564767562)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.8'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%200%2028.262001%20L%209.420667%2037.682667%20L%2037.682667%209.420667%20L%2028.262001%200%20L%200%2028.262001%20Z%20'/%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/svg%3e",Qe="data:image/svg+xml,%3csvg%20class='typst-doc'%20viewBox='0%200%20123.3858269517438%2066.69291415706147'%20width='123.3858269517438pt'%20height='66.69291415706147pt'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%20xmlns:h5='http://www.w3.org/1999/xhtml'%3e%3cpath%20class='typst-shape'%20fill='%23ffffff'%20fill-rule='nonzero'%20d='M%200%200%20L%200%2066.69292%20L%20123.385826%2066.69292%20L%20123.385826%200%20Z%20'/%3e%3cg%3e%3cg%20transform='translate(5%205)'%3e%3cg%20class='typst-group'%3e%3cg%3e%3cg%20transform='translate(0%2042.47745675307086)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%200%2014.215457%20L%2014.215457%200%20'/%3e%3c/g%3e%3cg%20transform='translate(42.47745675307083%200)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%2014.215457%200%20L%200%2014.215457%20'/%3e%3c/g%3e%3cg%20transform='translate(99.17037031898788%2042.477457524305564)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%2014.215457%2014.215457%20L%200%200%20'/%3e%3c/g%3e%3cg%20transform='translate(56.69291356591702%200.0000007712346918578343)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%200%200%20L%2014.215457%2014.215457%20'/%3e%3c/g%3e%3cg%20transform='translate(9.50512301432204%209.505123564767562)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.8'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%200%2028.262001%20L%209.420667%2037.682667%20L%2037.682667%209.420667%20L%2028.262001%200%20L%200%2028.262001%20Z%20'/%3e%3c/g%3e%3cg%20transform='translate(66.19803640014881%209.505123564767562)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.8'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%2028.262001%2037.682667%20L%2037.682667%2028.262001%20L%209.420667%200%20L%200%209.420667%20L%2028.262001%2037.682667%20Z%20'/%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/svg%3e",Xe="data:image/svg+xml,%3csvg%20class='typst-doc'%20viewBox='0%200%20123.3858269517438%20123.38582734244851'%20width='123.3858269517438pt'%20height='123.38582734244851pt'%20xmlns='http://www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%20xmlns:h5='http://www.w3.org/1999/xhtml'%3e%3cpath%20class='typst-shape'%20fill='%23ffffff'%20fill-rule='nonzero'%20d='M%200%200%20L%200%20123.385826%20L%20123.385826%20123.385826%20L%20123.385826%200%20Z%20'/%3e%3cg%3e%3cg%20transform='translate(5%205)'%3e%3cg%20class='typst-group'%3e%3cg%3e%3cg%20transform='translate(0%2042.47745675307086)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%200%2014.215457%20L%2014.215457%200%20'/%3e%3c/g%3e%3cg%20transform='translate(42.47745675307083%200)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%2014.215457%200%20L%200%2014.215457%20'/%3e%3c/g%3e%3cg%20transform='translate(99.17037031898788%2042.477457524305564)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%2014.215457%2014.215457%20L%200%200%20'/%3e%3c/g%3e%3cg%20transform='translate(56.69291356591702%200.0000007712346918578343)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%200%200%20L%2014.215457%2014.215457%20'/%3e%3c/g%3e%3cg%20transform='translate(0%2056.69291395662175)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%200%200%20L%2014.215457%2014.215457%20'/%3e%3c/g%3e%3cg%20transform='translate(42.47745675307083%2099.17037070969259)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.4'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%2014.215457%2014.215457%20L%200%200%20'/%3e%3c/g%3e%3cg%20transform='translate(9.50512301432204%209.505123564767562)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.8'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%200%2028.262001%20L%209.420667%2037.682667%20L%2037.682667%209.420667%20L%2028.262001%200%20L%200%2028.262001%20Z%20'/%3e%3c/g%3e%3cg%20transform='translate(66.19803640014881%209.505123564767562)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.8'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%2028.262001%2037.682667%20L%2037.682667%2028.262001%20L%209.420667%200%20L%200%209.420667%20L%2028.262001%2037.682667%20Z%20'/%3e%3c/g%3e%3cg%20transform='translate(9.50512301432204%2066.19803695059433)'%3e%3cpath%20class='typst-shape'%20fill='none'%20stroke='%23000000'%20stroke-width='0.8'%20stroke-linecap='butt'%20stroke-linejoin='miter'%20stroke-miterlimit='4'%20d='M%209.420667%200%20L%200%209.420667%20L%2028.262001%2037.682667%20L%2037.682667%2028.262001%20L%209.420667%200%20Z%20'/%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/g%3e%3c/svg%3e",ts=""+new URL("../assets/5.CWjPcJtT.svg",import.meta.url).href,es=""+new URL("../assets/6.sQ_vddzd.svg",import.meta.url).href,ss=""+new URL("../assets/7.BszVm1wK.svg",import.meta.url).href,rs=""+new URL("../assets/8.DfopD-9H.svg",import.meta.url).href,ns=""+new URL("../assets/9.BmOhU8e8.svg",import.meta.url).href,is=""+new URL("../assets/10.hY-THuq4.svg",import.meta.url).href,os=""+new URL("../assets/11.CUbTYbF_.svg",import.meta.url).href,as=""+new URL("../assets/12.miTRlGYE.svg",import.meta.url).href,ls=""+new URL("../assets/13.DpB1C_Py.svg",import.meta.url).href,cs=""+new URL("../assets/14.5MrKWJUE.svg",import.meta.url).href,hs=""+new URL("../assets/15.DtcFYcl-.svg",import.meta.url).href,us=""+new URL("../assets/16.BGWbll48.svg",import.meta.url).href,gs=""+new URL("../assets/17.CfnNqSuS.svg",import.meta.url).href,ms=""+new URL("../assets/18.CgroTelM.svg",import.meta.url).href,ps=""+new URL("../assets/19.C1dM6Gv1.svg",import.meta.url).href,fs=""+new URL("../assets/20.BZzxT3UD.svg",import.meta.url).href,V=[{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0))
})`,image:Ge},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
})`,image:We},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
})`,image:Qe},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
})`,image:Xe},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
})`,image:ts},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
})`,image:es},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2))
})`,image:ss},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2))
    wire("r4.out", (2,-2))
})`,image:rs},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2), u: $u_1$)
    wire("r4.out", (2,-2))
})`,image:ns},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2), u: $u_1$, label: "5V")
    wire("r4.out", (2,-2))
})`,image:is},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")
    wire("r4.out", (2,-2))
})`,image:os},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")
    wire("r4.out", (2,-2))
    npn("n1", (9,2))
})`,image:as},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")
    wire("r4.out", (2,-2))
    npn("n1", (9,2), envelope: true)
})`,image:ls},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")
    wire("r4.out", (2,-2))
    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))
})`,image:cs},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")
    wire("r4.out", (2,-2))
    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))
    wire("r1.out", "n1.b")
})`,image:hs},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")
    wire("r4.out", (2,-2))
    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))
    wire("r1.out", "n1.b")
    capacitor("c1", "n1.e", (rel: (2,0)))
})`,image:us},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")
    wire("r4.out", (2,-2))
    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))
    wire("r1.out", "n1.b")
    capacitor("c1", "n1.e", (rel: (2,0)))
    wire("n1.c", ((), "|-", "r4.out"), "r4.out")
})`,image:gs},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    wire("r1.out", (0,2))
    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")
    wire("r4.out", (2,-2))
    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))
    wire("r1.out", "n1.b")
    capacitor("c1", "n1.e", (rel: (2,0)))
    wire("n1.c", ((), "|-", "r4.out"), "r4.out")
    wire("c1.out", ((), "|-", "r4.out"), "r4.out")
})`,image:ms},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    afuse("f1", "r1.out", (2,2))
    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")
    wire("r4.out", (2,-2))
    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))
    wire("r1.out", "n1.b")
    capacitor("c1", "n1.e", (rel: (2,0)))
    wire("n1.c", ((), "|-", "r4.out"), "r4.out")
    wire("c1.out", ((), "|-", "r4.out"), "r4.out")
})`,image:ps},{code:`#import "@preview/zap:${L}"

#zap.canvas({
    import zap: *
    
    resistor("r1", (2,0), (4,2))
    resistor("r2", (6,0), (4,2))
    resistor("r3", (6,0), (4,-2))
    resistor("r4", (2,0), (4,-2))
    afuse("f1", (2,2), "r1.out", position: 40%)
    vsource("v1", (2,-2), (2,2), u: $u_1$, i: (label: $i_1$, position: end + bottom), label: "5V")
    wire("r4.out", (2,-2))
    npn("n1", (9,2), envelope: true, fill: blue.lighten(90%))
    wire("r1.out", "n1.b")
    capacitor("c1", "n1.e", (rel: (2,0)))
    wire("n1.c", ((), "|-", "r4.out"), "r4.out")
    wire("c1.out", ((), "|-", "r4.out"), "r4.out")
})`,image:fs}];var ds=U('<div class="flex w-screen flex-col px-5 py-14 md:min-h-screen md:py-20"><span class="text-new font-mono">Brand New Package</span> <span class="mt-2 max-w-7xl text-4xl font-medium tracking-tight text-balance font-stretch-expanded md:text-8xl">Your Typst circuit drawing <span class="icon-[hugeicons--paint-brush-04] -mx-0.5 -mb-2 size-9 md:size-20"></span> companion</span> <div class="mt-8 flex items-center gap-3"><a href="/docs" class="flex items-center gap-2 rounded-full bg-neutral-900 px-5 py-2 text-white transition hover:bg-neutral-900/90 dark:bg-white dark:text-black dark:hover:bg-white/90"><span class="icon-[hugeicons--book-open-02] size-5.5"></span> Documentation</a> <a href="/examples" class="rounded-full bg-gray-500 px-5 py-2 text-white transition hover:bg-gray-500/90 dark:bg-gray-600 dark:hover:bg-gray-600/90">Examples</a></div> <div class="mt-20 grid max-w-7xl items-start gap-8 text-left md:grid-cols-2"><!> <div class="dark:border-neutral-border flex min-h-96 items-center justify-center rounded-lg border border-neutral-200"><img alt="circuit"/></div></div></div>');function Cs(e,t){J(t,!0);let n=Z(wt(V[0].code)),s=Z(wt(V[0].image)),r=Z(0);Bt(()=>{let u=setInterval(()=>{console.log(S(r)),S(r)===V.length-1?clearInterval(u):Qt(r),q(n,V[S(r)].code,!0),q(s,V[S(r)].image,!0)},400);return()=>clearInterval(u)});var i=ds();te(u=>{Xt.title="Zap – Your Typst Circuit Drawing Companion"});var o=x(P(i),6),a=P(o);Je(a,{get code(){return S(n)}});var l=x(a,2),c=P(l);N(l),N(o),N(i),Rt(()=>re(c,"src",S(s))),D(e,i),G()}export{Cs as component};
