/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){function h(e,f,g){var h=this,i=d[h.id];if(!i)return;var j=h instanceof CKEDITOR.ui.dialog.checkbox;for(var k=0;k<i.length;k++){var l=i[k];switch(l.type){case a:if(!e)continue;if(e.getAttribute(l.name)!==null){var m=e.getAttribute(l.name);j?h.setValue(m.toLowerCase()=="true"):h.setValue(m);return}j&&h.setValue(!!l["default"]);break;case b:if(!e)continue;if(l.name in g){m=g[l.name],j?h.setValue(m.toLowerCase()=="true"):h.setValue(m);return}j&&h.setValue(!!l["default"]);break;case c:if(!f)continue;if(f.getAttribute(l.name)){m=f.getAttribute(l.name),j?h.setValue(m.toLowerCase()=="true"):h.setValue(m);return}j&&h.setValue(!!l["default"])}}}function i(e,f,g){var h=this,i=d[h.id];if(!i)return;var j=h.getValue()==="",k=h instanceof CKEDITOR.ui.dialog.checkbox;for(var l=0;l<i.length;l++){var m=i[l];switch(m.type){case a:if(!e||m.name=="data"&&f&&!e.hasAttribute("data"))continue;var n=h.getValue();j||k&&n===m["default"]?e.removeAttribute(m.name):e.setAttribute(m.name,n);break;case b:if(!e)continue;n=h.getValue();if(j||k&&n===m["default"])m.name in g&&g[m.name].remove();else if(m.name in g)g[m.name].setAttribute("value",n);else{var o=CKEDITOR.dom.element.createFromHtml("<cke:param></cke:param>",e.getDocument());o.setAttributes({name:m.name,value:n}),e.getChildCount()<1?o.appendTo(e):o.insertBefore(e.getFirst())}break;case c:if(!f)continue;n=h.getValue(),j||k&&n===m["default"]?f.removeAttribute(m.name):f.setAttribute(m.name,n)}}}var a=1,b=2,c=4,d={id:[{type:a,name:"id"}],classid:[{type:a,name:"classid"}],codebase:[{type:a,name:"codebase"}],pluginspage:[{type:c,name:"pluginspage"}],src:[{type:b,name:"movie"},{type:c,name:"src"},{type:a,name:"data"}],name:[{type:c,name:"name"}],align:[{type:a,name:"align"}],title:[{type:a,name:"title"},{type:c,name:"title"}],"class":[{type:a,name:"class"},{type:c,name:"class"}],width:[{type:a,name:"width"},{type:c,name:"width"}],height:[{type:a,name:"height"},{type:c,name:"height"}],hSpace:[{type:a,name:"hSpace"},{type:c,name:"hSpace"}],vSpace:[{type:a,name:"vSpace"},{type:c,name:"vSpace"}],style:[{type:a,name:"style"},{type:c,name:"style"}],type:[{type:c,name:"type"}]},e=["play","loop","menu","quality","scale","salign","wmode","bgcolor","base","flashvars","allowScriptAccess","allowFullScreen"];for(var f=0;f<e.length;f++)d[e[f]]=[{type:c,name:e[f]},{type:b,name:e[f]}];e=["allowFullScreen","play","loop","menu"];for(f=0;f<e.length;f++)d[e[f]][0]["default"]=d[e[f]][1]["default"]=!0;var g=CKEDITOR.tools.cssLength;CKEDITOR.dialog.add("flash",function(a){var b=!a.config.flashEmbedTagOnly,c=a.config.flashAddEmbedTag||a.config.flashEmbedTagOnly,d,e="<div>"+CKEDITOR.tools.htmlEncode(a.lang.common.preview)+"<br>"+'<div id="cke_FlashPreviewLoader'+CKEDITOR.tools.getNextNumber()+'" style="display:none"><div class="loading">&nbsp;</div></div>'+'<div id="cke_FlashPreviewBox'+CKEDITOR.tools.getNextNumber()+'" class="FlashPreviewBox"></div></div>';return{title:a.lang.flash.title,minWidth:420,minHeight:310,onShow:function(){var b=this;b.fakeImage=b.objectNode=b.embedNode=null,d=new CKEDITOR.dom.element("embed",a.document);var c=b.getSelectedElement();if(c&&c.data("cke-real-element-type")&&c.data("cke-real-element-type")=="flash"){b.fakeImage=c;var e=a.restoreRealElement(c),f=null,g=null,h={};if(e.getName()=="cke:object"){f=e;var i=f.getElementsByTag("embed","cke");i.count()>0&&(g=i.getItem(0));var k=f.getElementsByTag("param","cke");for(var l=0,n=k.count();l<n;l++){var o=k.getItem(l),p=o.getAttribute("name"),q=o.getAttribute("value");h[p]=q}}else e.getName()=="cke:embed"&&(g=e);b.objectNode=f,b.embedNode=g,b.setupContent(f,g,h,c)}},onOk:function(){var d=this,e=null,f=null,g=null;if(!d.fakeImage){if(b){e=CKEDITOR.dom.element.createFromHtml("<cke:object></cke:object>",a.document);var h={classid:"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000",codebase:"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"};e.setAttributes(h)}c&&(f=CKEDITOR.dom.element.createFromHtml("<cke:embed></cke:embed>",a.document),f.setAttributes({type:"application/x-shockwave-flash",pluginspage:"http://www.macromedia.com/go/getflashplayer"}),e&&f.appendTo(e))}else e=d.objectNode,f=d.embedNode;if(e){g={};var i=e.getElementsByTag("param","cke");for(var m=0,n=i.count();m<n;m++)g[i.getItem(m).getAttribute("name")]=i.getItem(m)}var o={},p={};d.commitContent(e,f,g,o,p);var q=a.createFakeElement(e||f,"cke_flash","flash",!0);q.setAttributes(p),q.setStyles(o),d.fakeImage?(q.replace(d.fakeImage),a.getSelection().selectElement(q)):a.insertElement(q)},onHide:function(){this.preview&&this.preview.setHtml("")},contents:[{id:"info",label:a.lang.common.generalTab,accessKey:"I",elements:[{type:"vbox",padding:0,children:[{type:"hbox",widths:["280px","110px"],align:"right",children:[{id:"src",type:"text",label:a.lang.common.url,required:!0,validate:CKEDITOR.dialog.validate.notEmpty(a.lang.flash.validateSrc),setup:h,commit:i,onLoad:function(){var a=this.getDialog(),b=function(b){d.setAttribute("src",b),a.preview.setHtml('<embed height="100%" width="100%" src="'+CKEDITOR.tools.htmlEncode(d.getAttribute("src"))+'" type="application/x-shockwave-flash"></embed>')};a.preview=a.getContentElement("info","preview").getElement().getChild(3),this.on("change",function(a){a.data&&a.data.value&&b(a.data.value)}),this.getInputElement().on("change",function(a){b(this.getValue())},this)}},{type:"button",id:"browse",filebrowser:"info:src",hidden:!0,style:"display:inline-block;margin-top:10px;",label:a.lang.common.browseServer}]}]},{type:"hbox",widths:["25%","25%","25%","25%","25%"],children:[{type:"text",id:"width",style:"width:95px",label:a.lang.common.width,validate:CKEDITOR.dialog.validate.htmlLength(a.lang.common.invalidHtmlLength.replace("%1",a.lang.common.width)),setup:h,commit:i},{type:"text",id:"height",style:"width:95px",label:a.lang.common.height,validate:CKEDITOR.dialog.validate.htmlLength(a.lang.common.invalidHtmlLength.replace("%1",a.lang.common.height)),setup:h,commit:i},{type:"text",id:"hSpace",style:"width:95px",label:a.lang.flash.hSpace,validate:CKEDITOR.dialog.validate.integer(a.lang.flash.validateHSpace),setup:h,commit:i},{type:"text",id:"vSpace",style:"width:95px",label:a.lang.flash.vSpace,validate:CKEDITOR.dialog.validate.integer(a.lang.flash.validateVSpace),setup:h,commit:i}]},{type:"vbox",children:[{type:"html",id:"preview",style:"width:95%;",html:e}]}]},{id:"Upload",hidden:!0,filebrowser:"uploadButton",label:a.lang.common.upload,elements:[{type:"file",id:"upload",label:a.lang.common.upload,size:38},{type:"fileButton",id:"uploadButton",label:a.lang.common.uploadSubmit,filebrowser:"info:src","for":["Upload","upload"]}]},{id:"properties",label:a.lang.flash.propertiesTab,elements:[{type:"hbox",widths:["50%","50%"],children:[{id:"scale",type:"select",label:a.lang.flash.scale,"default":"",style:"width : 100%;",items:[[a.lang.common.notSet,""],[a.lang.flash.scaleAll,"showall"],[a.lang.flash.scaleNoBorder,"noborder"],[a.lang.flash.scaleFit,"exactfit"]],setup:h,commit:i},{id:"allowScriptAccess",type:"select",label:a.lang.flash.access,"default":"",style:"width : 100%;",items:[[a.lang.common.notSet,""],[a.lang.flash.accessAlways,"always"],[a.lang.flash.accessSameDomain,"samedomain"],[a.lang.flash.accessNever,"never"]],setup:h,commit:i}]},{type:"hbox",widths:["50%","50%"],children:[{id:"wmode",type:"select",label:a.lang.flash.windowMode,"default":"",style:"width : 100%;",items:[[a.lang.common.notSet,""],[a.lang.flash.windowModeWindow,"window"],[a.lang.flash.windowModeOpaque,"opaque"],[a.lang.flash.windowModeTransparent,"transparent"]],setup:h,commit:i},{id:"quality",type:"select",label:a.lang.flash.quality,"default":"high",style:"width : 100%;",items:[[a.lang.common.notSet,""],[a.lang.flash.qualityBest,"best"],[a.lang.flash.qualityHigh,"high"],[a.lang.flash.qualityAutoHigh,"autohigh"],[a.lang.flash.qualityMedium,"medium"],[a.lang.flash.qualityAutoLow,"autolow"],[a.lang.flash.qualityLow,"low"]],setup:h,commit:i}]},{type:"hbox",widths:["50%","50%"],children:[{id:"align",type:"select",label:a.lang.common.align,"default":"",style:"width : 100%;",items:[[a.lang.common.notSet,""],[a.lang.common.alignLeft,"left"],[a.lang.flash.alignAbsBottom,"absBottom"],[a.lang.flash.alignAbsMiddle,"absMiddle"],[a.lang.flash.alignBaseline,"baseline"],[a.lang.common.alignBottom,"bottom"],[a.lang.common.alignMiddle,"middle"],[a.lang.common.alignRight,"right"],[a.lang.flash.alignTextTop,"textTop"],[a.lang.common.alignTop,"top"]],setup:h,commit:function(a,b,c,d,e){var f=this.getValue();i.apply(this,arguments),f&&(e.align=f)}},{type:"html",html:"<div></div>"}]},{type:"fieldset",label:CKEDITOR.tools.htmlEncode(a.lang.flash.flashvars),children:[{type:"vbox",padding:0,children:[{type:"checkbox",id:"menu",label:a.lang.flash.chkMenu,"default":!0,setup:h,commit:i},{type:"checkbox",id:"play",label:a.lang.flash.chkPlay,"default":!0,setup:h,commit:i},{type:"checkbox",id:"loop",label:a.lang.flash.chkLoop,"default":!0,setup:h,commit:i},{type:"checkbox",id:"allowFullScreen",label:a.lang.flash.chkFull,"default":!0,setup:h,commit:i}]}]}]},{id:"advanced",label:a.lang.common.advancedTab,elements:[{type:"hbox",widths:["45%","55%"],children:[{type:"text",id:"id",label:a.lang.common.id,setup:h,commit:i},{type:"text",id:"title",label:a.lang.common.advisoryTitle,setup:h,commit:i}]},{type:"hbox",widths:["45%","55%"],children:[{type:"text",id:"bgcolor",label:a.lang.flash.bgcolor,setup:h,commit:i},{type:"text",id:"class",label:a.lang.common.cssClass,setup:h,commit:i}]},{type:"text",id:"style",validate:CKEDITOR.dialog.validate.inlineStyle(a.lang.common.invalidInlineStyle),label:a.lang.common.cssStyle,setup:h,commit:i}]}]}})})()