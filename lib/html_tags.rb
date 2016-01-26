module HTMLTags
  HTML_TAGS = %w(
    html title body h1 h2 h3 h4 h5 h6 p br hr
    abbr address b bdi bdo blockquote cite code del dfn em i ins kbd mark meter
    pre progress q rp rt ruby s samp small strong sub sup time u var wbr
    form input textarea button select optgroup option label fieldset legend
    datalist keygen output iframe
    img map area canvas figcaption figure
    audio source track video
    a link nav
    ul ol li dl dt dd menu menuitem
    table caption th tr td thead tbody tfoot col colgroup
    style div span header footer main section article aside details dialog summary
    head meta base
    script noscript embed object param
  )

  def self.all
    HTML_TAGS
  end
end
