module Railsboot
  module ComponentTestHelpers
    include ActionView::Helpers::TagHelper
    include ViewComponent::TestHelpers
    include ViewComponent::SystemTestHelpers
    include Railsboot::ViewComponentsHelper
  end
end