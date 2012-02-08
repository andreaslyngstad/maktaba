class MarkdownPreviewController < ApplicationController

  def convert
    markdown = Redcarpet.new( MarkdownPreview.preprocess_markdown( params[:markdown_text] ) )

    html = markdown.to_html

    respond_to do |format|
      format.json { render :json => { :html => html } }
    end
  end

end

