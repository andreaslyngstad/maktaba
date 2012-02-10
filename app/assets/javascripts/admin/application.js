// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require ../set
//= require ckeditor/ckeditor
//= require ../jquery.markitup
//= require ../admin/markdownpreview.js
//= require ../admin/jquery.tablesorter.min
//= require_self


$(document).ready(function() {
   // $("textarea").markItUp(mySettings);
   // $("textarea").addClass("markdown_preview");
    $('.markdown_preview').markdownPreview();
	 $("#list_table").tablesorter();
    $('#language_name').autocomplete({
    source: $('#language_name').data('autocomplete-source')
    });

    $('#original_title').autocomplete({
    source: $('#original_title').data('autocomplete-source')
    });
    $('#author_name').autocomplete({
    source: $('#author_name').data('autocomplete-source')
    });
    $(".enable_path").click(function(){
      $("#country_path").removeAttr('disabled');
        return false
    });
    CKEDITOR.config.toolbar_Basic = [
        ['Source'],
        ['Undo','Redo','-','SelectAll','RemoveFormat'],
        ['Bold','Italic','Underline','Strike'], ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['Link','Unlink', 'Image'] ];
});