/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){CKEDITOR.plugins.add("ajax",{requires:["xml"]}),CKEDITOR.ajax=function(){var a=function(){if(!CKEDITOR.env.ie||location.protocol!="file:")try{return new XMLHttpRequest}catch(a){}try{return new ActiveXObject("Msxml2.XMLHTTP")}catch(b){}try{return new ActiveXObject("Microsoft.XMLHTTP")}catch(c){}return null},b=function(a){return a.readyState==4&&(a.status>=200&&a.status<300||a.status==304||a.status===0||a.status==1223)},c=function(a){return b(a)?a.responseText:null},d=function(a){if(b(a)){var c=a.responseXML;return new CKEDITOR.xml(c&&c.firstChild?c:a.responseText)}return null},e=function(b,c,d){var e=!!c,f=a();return f?(f.open("GET",b,e),e&&(f.onreadystatechange=function(){f.readyState==4&&(c(d(f)),f=null)}),f.send(null),e?"":d(f)):null};return{load:function(a,b){return e(a,b,c)},loadXml:function(a,b){return e(a,b,d)}}}()})()