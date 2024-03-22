require "rails/engine"
require "view_component"
require "view_component/version"

module Railsboot
  class Engine < ::Rails::Engine
    isolate_namespace Railsboot

    config.autoload_paths = %W[
      #{root}/app/components
      #{root}/app/helpers
    ]

    initializer "railsboot.helpers" do
      ActiveSupport.on_load(:action_controller_base) do
        helper Railsboot::ViewComponentsHelper
      end
    end
  end
end
