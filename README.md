# Briefcase

Slack Application Engineer Coding Exercise feat. Sinatra

Hosted on Heroku at: http://slack-briefcase.herokuapp.com/

## Notes

This application works in most situations, but it is not quite perfect. It runs into issues with lines of HTML that look like this:

```html
<div><span><p>
```

If `div`, `span`, _or_ `p` is selected for highlighting, the _entire_ line will be highlighted.

This is a limitation of the way the page is rendered. I put all of the HTML source in an `xmp` tag so that the browser would not try to render the source, and used the [code-prettify](https://github.com/google/code-prettify) library to pretty print the HTML source. This library added extra tags to the HTML source in the `xmp` tag, and those tags are how I was able to highlight the page. Unfortunately, the library considers the snippet `<div><span><p>` to be a single tag.

I determined that highlighting the entire tag chunk as the desired tag was better than not highlighting anything at all, as the user's eye will still be drawn to the highlight.

I considered trying to write some javascript to break up and tag each HTML tag with some sort of alternative rendering mechanism, but that could have gotten extremely hairy (would the code render correctly, or would the `xmp` tag prevent it from rendering correctly?), and I determined it was outside the scope of this 2-3 hour project.

I chose to try Sinatra instead of Rails because the application logic for this problem was very simple and I thought it would be fun. It would have been quicker to use Rails, but it is nice being able to keep the application very lightweight with Sinatra (not that it makes much of a difference here).

Overall I am pleased with how simple I could keep the application and solve the problem in a fun and friendly way.

## Installation Instructions

Ensure that Ruby `2.3` (and `bundler`) is installed, and simply

```bash
bundle install
```

## Usage

Start the application:

```bash
ruby app.rb
```
