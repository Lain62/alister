# frozen_string_literal: true

require_relative "alister/version"
require_relative 'html/html'
require_relative 'site'
require_relative 'assets'
require_relative 'self'

# An SSG (Static Site Generator) helper that allows you to easily create a site
# @example A simple site
#   root_page = Alister.html do
#     doctype
#     html lang: "en" do
#       head do
#         meta charset: "utf-8"
#         meta name: "viewport", content: "width=device-width, initial-scale=1"
#       end
#       body do
#         div id: "app" do
#           para "hello world"
#         end
#       end
#   end
#   s = Alister::Site.new
#   s.route "/", root_page
#   s.build "./build"
module Alister
  class Error < StandardError; end
  # Your code goes here...
end
