# frozen_string_literal: true

require 'webrick'

module Alister
  # An HTML Builder, the main thing that will be used
  # @example Creating a simple html
  #   builder = Alister.html do
  #     doctype
  #     html lang: "en" do
  #       head do
  #         meta charset: "utf-8"
  #         meta name: "viewport", content: "width=device-width, initial-scale=1"
  #       end
  #       body do
  #         div id: "app"
  #       end
  #   end
  # @yield Starts an html block
  # @return [HTML::Builder]
  def self.html(&block)
    html = HTML::Builder.new
    html.instance_eval(&block)
    html
  end

  # Used to test your server
  # @example Serve build folder
  #   Alister.serve('./build', 6969)
  # @param port [Integer] Port of where the site will be hosted in
  # @param path [String] Path to the folder that will be served, most likely a build folder
  # @return [void]
  def self.serve(path, port)
    if File.directory? path
      server = WEBrick::HTTPServer.new Port: port, DocumentRoot: path
      trap('INT') { server.shutdown }
      server.start
    else
      puts "[ERROR] Folder \"#{path}\" does not exist / is not a folder"
    end
  end
end
