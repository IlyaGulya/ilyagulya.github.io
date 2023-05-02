# Usage:
# This adds a tag by the name `inline_css`. It takes one argument which is the
# path to a CSS file without any quotes:
#
# {% inline_css public/css/atf.css %}
#
# This would then read the file in the given directory relative to the root of
# the Jekyll installation and then embed that CSS at that location.
#
# Installation:
#
# Copy this file and place it under _plugins directory. Naming of the file
# doesn't matter
module Jekyll
  class InlineSassTag < Liquid::Tag
    def initialize(tag_name, path_to_atf_css, tokens)
      super
      @full_path_to_atf_css = File.expand_path(path_to_atf_css.gsub("\"", '').strip)
    end

    def render(context)
      @atf_css_raw = context.registers[:site]
        .find_converter_instance(Jekyll::Converters::Scss)
        .convert(File.read(@full_path_to_atf_css))


      source = '<style type="text/css" media="screen">'
      source += @atf_css_raw
      source += '</style>'
    end
  end
end

Liquid::Template.register_tag('inline_sass', Jekyll::InlineSassTag)
