# frozen_string_literal: true

module Alister
  module HTML
    # Create a part of an element like puzzle pieces
    # @note this isn't meant to be used directly, you need multiple of these to create a full <p>foo</p>
    class Element
      # Creates "<tag" on {#to_s}
      TAG_START = :tag_start
      # Creates "</tag>\n" on {#to_s}
      TAG_END = :tag_end
      # Creates ">\n" on {#to_s}
      VALUE_BLOCK = :value_block
      # Creates ">value" on {#to_s}
      VALUE_LIT = :value_lit
      # Creates  "/>\n" on {#to_s}
      VALUE_NIL = :value_nil
      # Creates "<!DOCTYPE html>\\n" on {#to_s}
      DOCTYPE = :doctype
      # Creates " key=\"value\"" on {#to_s}
      ATTR = :attributes

      # @note Look up {Element} Constants for the value of id
      # @return [Symbol]
      attr_accessor :id

      # @return [String, void]
      attr_accessor :value

      # @param id [Symbol] Look up {Element} Constants for the value of id
      # @param value [String, void]
      def initialize(id:, value: nil)
        @id = id
        @value = value
        @value = 'p' if [TAG_START, TAG_END].include?(id) && value == 'para'
      end

      # Creates a string from part of an element
      # Depends on {#id} on what it will return
      # Look for {Element} Constants for returns
      # @return [String]
      def to_s
        case @id
        when TAG_START
          tag_start
        when TAG_END
          tag_end
        when VALUE_BLOCK
          value_block
        when VALUE_LIT
          value_lit
        when VALUE_NIL
          value_nil
        when ATTR
          attribute
        end
      end

      private

      def doctype
        "<!DOCTYPE html>\n"
      end

      def value_nil
        "/>\n"
      end

      def tag_start
        "<#{@value}"
      end

      def tag_end
        "</#{@value}>\n"
      end

      def value_block
        ">\n"
      end

      def value_lit
        ">#{@value}"
      end

      def attribute
        key = @value[:key].to_s.gsub('_', '-')
        " #{key}=\"#{@value[:value]}\""
      end
    end
  end
end
