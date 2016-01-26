require 'nokogiri'
require File.expand_path('../html_tags.rb', __FILE__)

# Summarizes a snippet of HTML source code.
class Summary
  attr_reader :html

  def initialize(html)
    @html = Nokogiri::HTML(html, &:noblanks)
  end

  def elements
    @elements ||= begin
      elements = {}

      HTMLTags.all.each do |tag|
        tag_count = html.css(tag).count
        elements[tag] = tag_count if tag_count > 0
      end

      elements
    end
  end
end
