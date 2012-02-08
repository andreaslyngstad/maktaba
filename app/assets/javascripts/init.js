
jQuery(function($){
     
	
    var r = Raphael('chaptersMap', 550, 550);
	r.safari();
	var _label = r.popup(50, 50, "").hide();
    attributes = {
    		
            fill: '#E35911',
            stroke: '#777',
            'stroke-width': 2,
            'stroke-linejoin': 'round'
        },
    arr = new Array();
    for (var country in paths) {
        var obj = r.path(paths[country].path);
        arr[obj.id] = country;
        
		obj.attr(attributes);
		obj.id = obj.id
		
        obj
        .hover(function(){
        	$("#about_country").find("." + this.id).show()
            this.animate({
                fill: '#FDB515'
            }, 300);
			bbox = this.getBBox();
			console.log(this.id);
			paths[arr[this.id]].slug 
					_label.attr({text: paths[arr[this.id]].name}).update(bbox.x, bbox.y + bbox.height/2, bbox.width).toFront().show();
				
			
        }, function(){
            this.animate({
                fill: attributes.fill
            }, 300);
			_label.hide();
        })
        .click(function(){
            
			location.href = paths[arr[this.id]].url;
             
        })	
    }
      
});
jQuery.expr[':'].raph=function
(objNode,intStackIndex,arrProperties,arrNodeStack){var c=objNode.getAttribute('class');return(c&&c.indexOf(arrProperties[3])!=-1);}