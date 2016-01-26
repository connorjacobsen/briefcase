$ ->
  active = undefined

  $('.selectable').on 'click', ->
    tag = this.id.split('-tag')[0]
    $("##{tag}-tag").toggleClass 'active'
    highlightTags(tag)

highlightTags = (tag) ->
  tags = $('#source-code').find('.tag')
  highlightElement(el, tag) for el in tags

highlightElement = (el, tag) ->
  html = _.unescape(el.innerHTML)
  $(el).toggleClass('highlight') if matchTag(tag, html)

matchTag = (tag, html) ->
  result = false
  tags = [ "<#{tag}", "<#{tag}>", "<#{tag}/>", "<#{tag} />", "</#{tag}>"]
  (result = true if t == html) for t in tags
  result
