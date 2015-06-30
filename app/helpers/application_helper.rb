module ApplicationHelper
  def nav_link(name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, block if block_given?
    options ||= {}

    html_options = convert_options_to_data_attributes(options, html_options)

    url = url_for(options)
    html_options['href'] ||= url

    # modification to add current class
    html_options['class'] = 'current' if current_page?(options)

    content_tag(:a, name || url, html_options, &block)
  end
end
