//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require raphael.js
//= require raphael_popup.js
//= require jquery.markitup
//= require markdownpreview
//= require set
//= require_self
jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    $('.spinning').show();
    return false;
  })
  return this;
};

jQuery.fn.vote_up = function (){
  this.click(function(){
        id = $(this).attr("data-id");
		object = $(this).attr("data-object");
        text = $(this).siblings(".vote-count").text();
        direction = $(this).attr("data-direction");
        if ($(this).hasClass("vote-up-on")) {
        $.get("/" + object + "/" + id + "/remove_points");
        $(this).removeClass("vote-up-on")
        $(this).siblings(".vote-count").text(parseInt(text) - 1)
        }else {
        $(this).siblings(".vote-count").text(parseInt(text) + 1)
		$.get("/" + object  + "/" + id + "/add_points");
        $(this).addClass("vote-up-on")
        }
		});
};
jQuery.fn.vote_down = function (){
  this.click(function() {
      id = $(this).attr("data-id");
      object = $(this).attr("data-object");
      text = $(this).siblings(".vote-count").text();
      if (!$(this).hasClass('vote-down-on')) {
          $(this).siblings(".vote-count").text(parseInt(text) - 1)
          $.get("/" + object + "/" + id + "/remove_points");
          $(this).addClass("vote-down-on")
      } else {
          $.get("/" + object + "/" + id + "/add_points");
          $(this).removeClass("vote-down-on")
          $(this).siblings(".vote-count").text(parseInt(text) + 1)
      }
  });
};

$(document).ready(function() {
    $("textarea").markItUp(mySettings);
    $("textarea").addClass("markdown_preview");
    $('.markdown_preview').markdownPreview();
	$(".vote-up-off").vote_up()
	$(".vote-down-off").vote_down()
    $(".is_this_a_translation").click(function(){
		$(".translation_fields").toggle();
        return false
      });
	$(".login").click(function(){
		$(this).toggleClass("login_show");
		$("#login_form").toggle();
	});

	$("#more_languages").click(function(){
		var text = $(this).text() == "View more languages" ? "Hide more languages" : "View more languages";
		$(this).text(text)
		$(".lang_not_common").slideToggle();
		return false
	});
	
	$("#user_country_id").change(function(){
		$("img").show()
		obj_id = this.value.toString()
		
		$.getScript("/languages_in_country/" + obj_id)
	
	});
    $(".show_comment_edit").click(function(){


     $("#edit_comment_" + $(this).attr("id")).toggle();
        if($(this).text() == "close"){
          $(this).text("edit")
        }else{
         $(this).text("close")
        }

        return false
    });
	$('#search_friends').autocomplete({
    source: $('#search_friends').data('autocomplete-source')
    });
    $('#language_name').autocomplete({
    source: $('#language_name').data('autocomplete-source')
    });

    $('#original_title').autocomplete({
    source: $('#original_title').data('autocomplete-source')
    });

    $('#author_name').autocomplete({
    source: $('#author_name').data('autocomplete-source')
    });
    
});