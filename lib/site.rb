# frozen_string_literal: true

require 'fileutils'

module Alister
  # Main site builder use this to build your site
  # @example A simple site
  #   s = Alister::Site.new
  #   s.route '/', pageroot_page
  #   s.route '/about/', pageabout_page
  #   s.build("./build")
  #
  #   s.file '/main.css', scss_string
  #   s.build_and_reset("./build")
  #   s.assets do
  #     source "./assets"
  #     enable_webp_conversion unless DEBUG
  #     file "**/*"
  #     build_to_and_reset "./build/assets/"
  #
  #     source "./additions"
  #     files "robots.txt", "not_found.html"
  #     build_to_and_reset "./build/"
  #   end
  class Site
    # @note Please dont use this, this is not meant to be used outside at all
    Page = Struct.new(:path, :content)

    def initialize
      @path = nil
      @routes = []
      @files = []
    end

    # Creates a new html page on path
    # @param path [String] route path on where to build
    # @param page [HTML::Builder, HTML::Element, String] content that will be put inside the page
    # return [void]
    def route(path, page)
      @routes << Page.new(path, page)
    end

    # Creates a new file on path
    # @param path [String] route path on where to build, including the name of the file
    # @param string [String] content that will be put inside the file
    # return [void]
    def file(path, string)
      @files << Page.new(path, string)
    end

    # Builds the site
    # @param path [String] path on where to build
    # return [void]
    def build_to(path)
      @path = path
      @routes.each do |route|
        create_file(route, 'index.html')
      end
      @files.each do |file|
        create_file(file)
      end
      puts '[LOG] Finished creating files'
    end

    alias build build_to

    # Create assets easier
    # @yield Start block of asset
    # @example
    #   s = Alister::Site.new
    #   s.assets do
    #     source "./assets"
    #     enable_webp_conversion unless DEBUG
    #     file "**/*"
    #     build_to_and_reset "./build/assets/"
    #   end
    # return [void]
    def assets(&block)
      assets = Alister::Assets.new
      assets.instance_eval(&block)
    end

    # Resets the site builder for next build
    # return [void]
    def reset
      @path = nil
      @routes = []
      @files = []
    end

    # Builds and then resets the site builder
    # @param path [String] path on where to build
    # return [void]
    def build_to_and_reset(path)
      build_to(path)
      reset
    end

    alias build_and_reset build_to_and_reset

    private

    def create_file(route, name = nil)
      path = File.join(@path, route.path)
      file_path = name ? File.join(path, name) : path

      FileUtils.mkdir_p(File.dirname(file_path))
      FileUtils.touch(file_path)

      file = File.new(file_path, 'w+')
      file.write(route.content.to_s)
      file.close
      puts "[LOG] Creating file #{file_path}"
    end
  end
end
