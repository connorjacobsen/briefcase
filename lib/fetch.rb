require 'open-uri'
require 'uri'

# Fetch downloads HTML source from a given URL.
module Fetch
  def self.html_from(uri)
    open(URI(uri))
  end
end
