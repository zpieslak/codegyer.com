module ApplicationHelper
  #def is_current?(options)
  #  current_page?(options) ? { class: "current" } : {}
  #end

  def nav_link(name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, block if block_given?
    options ||= {}

    html_options = convert_options_to_data_attributes(options, html_options)

    url = url_for(options)
    html_options['href'] ||= url

    # modification to add current class
    html_options['class'] = "current" if current_page?(options)

    content_tag(:a, name || url, html_options, &block)
  end

  # Does NOT behave identical to current Rails truncate method
  # you must pass options as a hash not just values
  # Sample usage: <%= html_truncate(category.description, :length =>
  # 120, :omission => "(continued...)" ) -%>...
  def html_truncate(html, truncate_length, options={})
    text, result = [], []
    # get all text (including punctuation) and tags and stick them in a hash
    html.scan(/<\/?[^>]*>|[A-Za-z0-9.,\/&#;\!\+\(\)\-"'?]+/).each { |t| text << t }
    text.each do |str|
      if truncate_length > 0
        if str =~ /<\/?[^>]*>/
          previous_tag = str
          result << str
        else
          result << str
          truncate_length -= str.length
        end
      else
        # now stick the next tag with a  that matches the previous
        # open tag on the end of the result
        if previous_tag && str =~ /<\/([#{previous_tag}]*)>/
          result << str
        end
      end
    end
    return result.join(" ") + options[:omission].to_s
  end
end
