# frozen_string_literal: true

module Alister
  module HTML
    # All the html tags
    # @note p is reserved by ruby, use para instead
    TAGS = %i[html body div span applet object iframe
              h1 h2 h3 h4 h5 h6 para blockquote pre
              a abbr acronym address big cite code del
              dfn em img ins kbd q s samp small
              strike strong sub sup tt var b u i
              center meta dl dt dd ol ul li fieldset
              form label legend table caption tbody tfoot
              thead tr th td article aside canvas details
              embed figure figcaption footer header hgroup
              menu nav output ruby section summary time
              mark audio video script head title link].freeze

    # An HTML Builder class
    # @example Creating a simple html
    #   builder = Alister::Builder.new
    #   builder.start do
    #     doctype
    #     html lang: "en" do
    #       head do
    #         meta charset: "utf-8"
    #         meta name: "viewport", content: "width=device-width, initial-scale=1"
    #       end
    #       body do
    #         div id: "app"
    #       end
    #     end
    #   end
    class Builder
      # All the elements that has been collected
      # @return [Array<Element>]
      attr_reader :elements

      def initialize
        @elements = []
      end

      # @note only use if you're using {Builder} directly
      # @yield Starts an html block
      def start(&block)
        block.call
      end

      TAGS.each do |tag|
        define_method(tag) do |value = nil, **args, &block|
          @elements << Element.new(id: Element::TAG_START, value: tag.to_s)
          args&.each_key do |key|
            @elements << Element.new(id: Element::ATTR, value: { key: key, value: args[key] })
          end

          if !block.nil?
            @elements << Element.new(id: Element::VALUE_BLOCK)
            block.call
            @elements << Element.new(id: Element::TAG_END, value: tag.to_s)
          elsif !value.nil?
            @elements << Element.new(id: Element::VALUE_LIT, value: value)
            @elements << Element.new(id: Element::TAG_END, value: tag.to_s)
          else
            @elements << Element.new(id: Element::VALUE_NIL, value: nil)
          end
        end
      end

      # Creates a <!DOCTYPE html> element and puts it to {#elements}.
      # @return [void]
      def doctype
        @elements << Element.new(id: Element::DOCTYPE, value: nil)
      end

      # Adds a partial element and puts it to {#elements}
      # @param element [Builder, Element, String, Array<Builder, Element, String>] Basically anything that can convert to string tbh
      # @return [void]
      def partial(element)
        @elements << element.elements if element.is_a? Builder
        @elements << element if element.is_a?(Element) || element.is_a?(String)

        return unless element.is_a? Array

        element.each do |el|
          partial(el)
        end
      end

      # Combines all elements, and turn it into a single string
      # @return [String]
      def to_s
        @elements.flatten!
        @elements.map(&:to_s).join
      end
    end
  end
end
