# Railsboot
### Railsboot is an implementation of the famous Bootstrap CSS framework using Rails View Components.
[![CI](https://github.com/dotruby/railsboot/workflows/CI/badge.svg)](https://github.com/dotruby/railsboot/actions) [![Gem Version](https://badge.fury.io/rb/railsboot.svg)](https://badge.fury.io/rb/railsboot)

## Preview
You'll find detailed information on how to use Railsboot on https://railsbootui.com

## Installation

Add `railsboot` to your Gemfile and run `bundle install`:

```ruby
bundle add railsboot && bundle install
```

Also make ensure that you have correctly setup bootstrap in your Rails app. Otherwise the bootstrap styles and js files will not work.

## Usage
Each view component can be rendered with either a standard component call

```erb
<%= render Railsboot::BadgeComponent.new { "My badge"} %>
```

or with the integrated component helper

```erb
<%= railsboot_badge { "My badge"} %>
```

## Configuration
Several view components ensure a valid bootstrap theme color scheme, so if you tweaked or enhanced the standard bootstrap volor palette, you should also add this to the gem. Create an initializer (in `config/initializers/railsboot.rb`):

```ruby
# defaults to ["primary", "secondary", "success", "danger", "warning", "info", "light", "dark"]
Railsboot.colors = ["primary", "secondary", "my-color"]
```

## Development
Download the source code and run

1. `bundle install` for instaling the dev dependencies
2. `bundle exec rake test` for running the test

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
