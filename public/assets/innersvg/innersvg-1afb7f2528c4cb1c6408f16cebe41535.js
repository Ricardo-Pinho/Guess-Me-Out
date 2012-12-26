/**
 * innerHTML property for SVGElement
 * Copyright(c) 2010, Jeff Schiller
 *
 * Licensed under the Apache License, Version 2
 *
 * Works in a SVG document in Chrome 6+, Safari 5+, Firefox 4+ and IE9+.
 * Works in a HTML5 document in Chrome 7+, Firefox 4+ and IE9+.
 * Does not work in Opera since it doesn't support the SVGElement interface yet.
 *
 * I haven't decided on the best name for this property - thus the duplication.
 */
(function(){var e=function(t,n){var r=t.nodeType;if(r==3)n.push(t.textContent.replace(/&/,"&amp;").replace(/</,"&lt;").replace(">","&gt;"));else if(r==1){n.push("<",t.tagName);if(t.hasAttributes()){var i=t.attributes;for(var s=0,o=i.length;s<o;++s){var u=i.item(s);n.push(" ",u.name,"='",u.value,"'")}}if(t.hasChildNodes()){n.push(">");var a=t.childNodes;for(var s=0,o=a.length;s<o;++s)e(a.item(s),n);n.push("</",t.tagName,">")}else n.push("/>")}else{if(r!=8)throw"Error serializing XML. Unhandled node of type: "+r;n.push("<!--",t.nodeValue,"-->")}};Object.defineProperty(SVGElement.prototype,"innerHTML",{get:function(){var t=[],n=this.firstChild;while(n)e(n,t),n=n.nextSibling;return t.join("")},set:function(e){while(this.firstChild)this.removeChild(this.firstChild);try{var t=new DOMParser;t.async=!1,sXML="<svg xmlns='http://www.w3.org/2000/svg'>"+e+"</svg>";var n=t.parseFromString(sXML,"text/xml").documentElement,r=n.firstChild;while(r)this.appendChild(this.ownerDocument.importNode(r,!0)),r=r.nextSibling}catch(i){throw new Error("Error parsing XML string")}}}),Object.defineProperty(SVGElement.prototype,"innerSVG",{get:function(){return this.innerHTML},set:function(e){this.innerHTML=e}})})();