    (function( $ ){

      $.fn.markdownPreview = function( type ) {  

        return this.each(function() {

          var $this = $(this);

          $this.wrap( '<div class="markdown_wrap editing"></div>' );

          $this.before( '<div class="markdown_wrap_menu"><div class="markdown_wrap_menu_edit">Write</div><div class="markdown_wrap_menu_preview">Preview</div></div>' );

          $this.wrap( '<div class="markdown_wrap_content"></div>' );
          $this.after( '<div class="markdown_wrap_preview"></div>' );
          
          $this.wrap( '<div class="markdown_wrap_editor"></div>' );
            
          /*
          if ( !type || type == 'width' ) {
            $this.width( $this.width() );
          }

          if ( !type || type == 'height' ) {
            $this.height( $this.height() );
          }*/

        });

      };

      $( '.markdown_wrap_menu_edit' ).live( 'click', function(){

        $( this ).closest( '.markdown_wrap' ).removeClass( 'previewing' ).addClass( 'editing' );

        $( this ).closest( '.markdown_wrap' ).find( '.markdown_wrap_preview' ).hide();
        $( this ).closest( '.markdown_wrap' ).find( '.markdown_wrap_editor' ).show();
      });
      
      $( '.markdown_wrap_menu_preview' ).live( 'click', function(){
        //console.log( 'Clicked Preview' );
        $( this ).closest( '.markdown_wrap' ).removeClass( 'editing' ).addClass( 'previewing' );

        var editor  = $( this ).closest( '.markdown_wrap' ).find( '.markdown_wrap_editor' );
        var preview = $( this ).closest( '.markdown_wrap' ).find( '.markdown_wrap_preview' );

        preview.html( 'Loading...' );

        editor.hide();
        preview.show();

        var editor_content = editor.find( 'textarea' ).val();

        $.ajax({
          type: 'POST',
          url: '/markdown_preview/convert',
          data: { 'format' : 'json', 'markdown_text' : editor_content },
          success: function( data, textStatus, jqXHR ){
            preview.html( data['html'] );
          },
          error: function(jqXHR, textStatus, errorThrown){
            //console.log( "ERROR" );
            //console.log( jqXHR );
            //console.log( textStatus );
            //console.log( errorThrown );
          },
          dataType: 'text json' 
        });
        
      });
    })( jQuery );


    $( document ).ready( function(){
      $('.markdown_preview').markdownPreview();
    });

