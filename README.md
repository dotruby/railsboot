# Railsboot
Railsboot is an implementation of the famous Bootstrap CSS framework using Rails View Components.

## Preview
https://railsbootui.com

## Installation

Add `railsboot` to your Gemfile:

```ruby
bundle add railsboot
```

and run `bundle install`.

Ensure that you have correctly setup bootstrap in your Rails app.

## Usage
Each view component can be rendered with either a standard component call

```erb
<%= render Railsboot::BadgeComponent.new { "My badge"} %>
```

or with the integrated helper

```erb
<%= railsboot_badge { "My badge"} %>
```

## Development
Download the source code and run

1. `bundle install` for instaling the dev dependencies
2. `bundle exec rake test` for running the test

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
