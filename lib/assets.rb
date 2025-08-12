# frozen_string_literal: true

require 'fileutils'
require 'webp-ffi'

module Alister
  # @example Simple asset building
  #   a = Alister::Assets.new
  #   a.source "./assets/"
  #   a.file "**/*"
  #   a.build_to "./build/assets/"
  # @example Convert all png to webp
  #   a = Alister::Assets.new
  #   a.source "./assets/"
  #   a.file "*.png"
  #   a.enable_webp_conversion
  #   a.build "./build/assets/gallery/"
  # @example Multiple sources and specific files
  #   a = Alister::Assets.new
  #   a.source "./"
  #   a.files "robots.txt", "main.css"
  #   a.build_and_reset "./build/assets/gallery/"
  #   a.source "./assets/"
  #   a.file "*.png"
  #   a.enable_webp_conversion
  #   a.build_and_reset "./build/assets/gallery/"
  # An asset builder that helps with putting website asset files into the correct place
  class Assets
    # All supported image filetype that can be converted to .webp
    WEBP_EXTS = %w[.png .jpg .jpeg .tiff].freeze
    def initialize
      @source_path = nil
      @build_path = nil
      @webp_conversion = false
      @excludes = nil
      @files = nil
      @source_files = nil
    end

    # Enables turning all suitable images into webp when building
    # @return [void]
    def enable_webp_conversion
      @webp_conversion = true
    end

    # Exclude certain folders from being built
    # @return [void]
    def excludes(*args)
      if args.size == 1
        @excludes = args.first
        nil
      else
        @excludes = args
      end
    end

    alias exclude excludes

    # Defines the files that will be included in the build
    # @return [void]
    def files(*args)
      if args.size == 1
        @files = args.first
        nil
      else
        @files = args
      end
    end

    alias file files

    # Builds the assets
    # @return [void]
    def build_to(build_path)
      raise '[ERROR] Files are empty' if @files.nil?
      raise '[ERROR] Source is empty' if @source_path.nil?

      @build_path = build_path

      glob_source_files
      remove_excludes unless @excludes.nil?
      ensure_folders_are_built_first
      build_da_thing
    end

    alias build build_to

    # Defines the source of the files
    # @return [void]
    def source_from(source_path)
      @source_path = source_path
    end

    alias source source_from

    # Resets the builder for another building
    # @return [void]
    def reset
      @source_path = nil
      @build_path = nil
      @webp_conversion = false
      @excludes = nil
      @files = nil
      @source_files = nil
    end

    # Shorthand for building and resetting at the same time
    # @return [void]
    def build_to_and_reset(build_path)
      build_to(build_path)
      reset
    end

    alias build_and_reset build_to_and_reset

    private

    def build_da_thing
      files = @source_files.select { |f| File.file? f }
      if @webp_conversion
        files.each do |file|
          if WEBP_EXTS.include? File.extname(file)
            convert_webp(file)
          else
            copy(file)
          end
        end
      else
        files.each do |file|
          copy(file)
        end
      end
    end

    def convert_webp(file)
      output = convert_output_to_webp(file)
      WebP.encode(file, output)
      puts "[Log] Converting #{file} to #{output}"
    end

    def convert_output_to_webp(file)
      name = File.basename(file, File.extname(file))
      new_file_path = change_starting_folders(file, @source_path, @build_path)
      dir = File.dirname(new_file_path)
      "#{File.join(dir, name)}.webp"
    end

    def copy(file)
      name = File.basename(file)
      path = change_starting_folders(file, @source_path, @build_path)
      path = File.dirname path
      FileUtils.cp(file, path)
      puts "[Log] Copying #{file} to #{File.join(@build_path, name)}"
    end

    def glob_source_files
      if @files.is_a? Array
        @source_files = []
        @files.each do |file|
          files = Dir.glob(File.join(@source_path, file))
          @source_files.concat(files).uniq!
        end
      else
        @source_files = Dir.glob(File.join(@source_path, @files))
      end
    end

    def remove_excludes
      excludes = @excludes.map { |x| File.join(@source_path, x) }
      @source_files.reject! { |x| x.start_with?(*excludes) }
    end

    def ensure_build_folder_is_empty
      return unless File.directory? @build_path

      FileUtils.rm_rf(@build_path, secure: true)
      puts "[Log] #{@build_path} directory found, deleting"
    end

    def ensure_folders_are_built_first
      folders = @source_files.select { |x| File.directory? x }

      folders.each do |folder|
        File.join(@build_path, File.join(*(folder.split('/') - @source_path.split('/'))))
        path = change_starting_folders(folder, @source_path, @build_path)
        FileUtils.mkdir_p(path)
        puts "[Log] Creating folder #{path}"
      end
    end

    def change_starting_folders(path, what_to_remove, what_to_insert)
      File.join(what_to_insert, File.join(*(path.split('/') - what_to_remove.split('/'))))
    end
  end
end
