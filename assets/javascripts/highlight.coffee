$ ->
  active = undefined

  $('.selectable').on 'click', ->
    tag = this.id.split('-tag')[0]
    unless active == tag
      $("##{active}-tag").removeClass 'active'
      $(this).addClass 'active'
      active = tag

      elements = $('#source-code').find(tag)
      $(el).addClass 'highlight' for el in elements
