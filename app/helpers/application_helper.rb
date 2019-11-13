module ApplicationHelper
  require "uri"

  def full_title(page_name = "")
    base_title = "Sample"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
  
  def content_url_to_link(content)
    URI.extract(content, ["http", "https"]).uniq.each do |url|
      sub_content = ""
      sub_content << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
      content.gsub!(content, sub_content)
    end
    return content
  end
  
end