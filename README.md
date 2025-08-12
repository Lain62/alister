# Alister

A super minimal ruby solution to static site generation. This gem allows you to create a static site whilst writing almost purely ruby!

## Installation

Install all the dependencies first:

For Ubuntu, Debian:

    sudo apt-get install libjpeg-dev libpng-dev libtiff-dev libwebp-dev

For Fedora, CentOS:

    sudo dnf install libjpeg-devel libpng-devel libtiff-devel libwebp-devel

For Mac OS:

    brew install libjpg libpng libtiff webp

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add alister
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install alister
```

## Usage

```ruby
require 'alister'

root_page = Alister.html do
  doctype
  html lang: "en" do
    head do
      meta charset: "utf-8"
      meta name: "viewport", content: "width=device-width, initial-scale=1"
    end
    body do
      div id: "app" do
        p "hello world"
      end
    end
end
s = Alister::Site.new
s.route "/", root_page
s.build "./build"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lain62/alister. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/lain62/alister/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Alister project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lain62/alister/blob/main/CODE_OF_CONDUCT.md).
