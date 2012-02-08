module ApplicationHelper
  def markdown(text)
    unless text.nil?
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis]
    Redcarpet.new(text, *options).to_html.html_safe
    end
  end

  def markdown_safe(text)
    unless text.nil?
    options = [:hard_wrap, :autolink, :no_intraemphasis]
    Redcarpet.new(text, *options).to_html.html_safe
    end
  end
  
  def image(person, css_class)     
    if person.image_file_name.nil? && css_class == "thumb"
      image_tag("http://www.gravatar.com/avatar/#{Digest::MD5::hexdigest(person.email)}?default=mm&s=50", :alt => 'Avatar', :class => css_class)
    elsif person.image_file_name.nil? && css_class == "image150"
      image_tag("http://www.gravatar.com/avatar/#{Digest::MD5::hexdigest(person.email)}?default=mm&s=150", :alt => 'Avatar', :class => css_class)
    else
      if css_class == "thumb"
        image_tag person.image.url(:thumb), :class => css_class
      elsif css_class == "image150" or css_class == "image64"
        image_tag person.image.url(:medium), :class => css_class
      end
    end
  end
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
