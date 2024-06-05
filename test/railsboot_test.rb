require "test_helper"

class RailsbootTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert Railsboot::VERSION
  end

  test "it defines a colors attribute" do
    assert Railsboot.colors, ["primary", "secondary", "success", "danger", "warning", "info", "light", "dark"]
  end
end
