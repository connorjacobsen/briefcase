module Helpers
  def render_template(templ, options={})
    haml :application, layout: false do
      haml templ, options
    end
  end
end
