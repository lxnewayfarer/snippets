# frozen_string_literal: true

module Redcarpet
  class MarkdownRender < Redcarpet::Render::HTML
    @@list_step = 0

    def paragraph(text)
      text
    end

    def block_quote(quote)
      %(> #{quote})
    end

    def header(text, _header_level)
      %(<b>#{text}</b>)
    end

    def list(contents, _list_type)
      contents
    end

    def list_item(text, list_type)
      case list_type
      when :ordered
        @@list_step += 1
        "#{@@list_step}. #{text.strip}\n"
      when :unordered
        "- #{text.strip}\n"
      end
    end
  end
end
