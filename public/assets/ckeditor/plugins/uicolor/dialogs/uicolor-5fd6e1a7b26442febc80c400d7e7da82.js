/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("uicolor",function(a){function g(a){/^#/.test(a)&&(a=window.YAHOO.util.Color.hex2rgb(a.substr(1))),c.setValue(a,!0),c.refresh(f)}function h(d,e){(e||b._.contents.tab1.livePeview.getValue())&&a.setUiColor(d),b._.contents.tab1.configBox.setValue('config.uiColor = "#'+c.get("hex")+'"')}var b,c,d,e=a.getUiColor(),f="cke_uicolor_picker"+CKEDITOR.tools.getNextNumber();d={id:"yuiColorPicker",type:"html",html:"<div id='"+f+"' class='cke_uicolor_picker' style='width: 360px; height: 200px; position: relative;'></div>",onLoad:function(a){var d=CKEDITOR.getUrl("plugins/uicolor/yui/");c=new window.YAHOO.widget.ColorPicker(f,{showhsvcontrols:!0,showhexcontrols:!0,images:{PICKER_THUMB:d+"assets/picker_thumb.png",HUE_THUMB:d+"assets/hue_thumb.png"}}),e&&g(e),c.on("rgbChange",function(){b._.contents.tab1.predefined.setValue(""),h("#"+c.get("hex"))});var i=new CKEDITOR.dom.nodeList(c.getElementsByTagName("input"));for(var j=0;j<i.count();j++)i.getItem(j).addClass("cke_dialog_ui_input_text")}};var i=!0;return{title:a.lang.uicolor.title,minWidth:360,minHeight:320,onLoad:function(){b=this,this.setupContent(),CKEDITOR.env.ie7Compat&&b.parts.contents.setStyle("overflow","hidden")},contents:[{id:"tab1",label:"",title:"",expand:!0,padding:0,elements:[d,{id:"tab1",type:"vbox",children:[{id:"livePeview",type:"checkbox",label:a.lang.uicolor.preview,"default":1,onLoad:function(){i=!0},onChange:function(){if(i)return;var a=this.getValue(),b=a?"#"+c.get("hex"):e;h(b,!0)}},{type:"hbox",children:[{id:"predefined",type:"select","default":"",label:a.lang.uicolor.predefined,items:[[""],["Light blue","#9AB8F3"],["Sand","#D2B48C"],["Metallic","#949AAA"],["Purple","#C2A3C7"],["Olive","#A2C980"],["Happy green","#9BD446"],["Jezebel Blue","#14B8C4"],["Burn","#FF893A"],["Easy red","#FF6969"],["Pisces 3","#48B4F2"],["Aquarius 5","#487ED4"],["Absinthe","#A8CF76"],["Scrambled Egg","#C7A622"],["Hello monday","#8E8D80"],["Lovely sunshine","#F1E8B1"],["Recycled air","#B3C593"],["Down","#BCBCA4"],["Mark Twain","#CFE91D"],["Specks of dust","#D1B596"],["Lollipop","#F6CE23"]],onChange:function(){var a=this.getValue();a?(g(a),h(a),CKEDITOR.document.getById("predefinedPreview").setStyle("background",a)):CKEDITOR.document.getById("predefinedPreview").setStyle("background","")},onShow:function(){var b=a.getUiColor();b&&this.setValue(b)}},{id:"predefinedPreview",type:"html",html:'<div id="cke_uicolor_preview" style="border: 1px solid black; padding: 3px; width: 30px;"><div id="predefinedPreview" style="width: 30px; height: 30px;">&nbsp;</div></div>'}]},{id:"configBox",type:"text",label:a.lang.uicolor.config,onShow:function(){var b=a.getUiColor();b&&this.setValue('config.uiColor = "'+b+'"')}}]}]}],buttons:[CKEDITOR.dialog.okButton]}})