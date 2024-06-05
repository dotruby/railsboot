require "railsboot/version"
require "railsboot/engine"

module Railsboot
  # Your code goes here...

  mattr_accessor :colors
  @@colors = ["primary", "secondary", "success", "danger", "warning", "info", "light", "dark"]
end
