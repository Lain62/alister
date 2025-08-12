# frozen_string_literal: true

# THIS IS JUST TO GENERATE YARD TAGS, IGNORE

require_relative 'builder'

str = +"# frozen_string_literal: true\n\n"
str << "module Alister\n"
str << "  module HTML\n"
str << "    class Builder\n\n"
Alister::HTML::TAGS.each do |tag|
  str << "      # @!method #{tag}(value = nil, **args, &block)\n"
  tag = :p if tag == :para
  str << "      #   Creates a <#{tag}> element and puts it to {#elements}\n"
  str << "      #   @param value [String] The value of the element\n"
  str << "      #   @param args [Hash] The attributes of the element\n"
  str << "      #   @return [void]\n"
  str << "      #   @yield Create child elements of <#{tag}>\n"
  str << "\n"
end
str << "    end\n"
str << "  end\n"
str << "end\n"

File.delete('./yard_tags.rb') if File.exist? './yard_tags.rb'
file = File.new('./yard_tags.rb', 'w+')
file.write(str)
file.close
puts '[LOG] Created yard_tags.rb'
