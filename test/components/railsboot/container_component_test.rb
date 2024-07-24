require "test_helper"

class Railsboot::ContainerComponentTest < ViewComponent::TestCase
  test "renders content within container" do
    render_inline(Railsboot::ContainerComponent.new) { "Some Content" }
    assert_selector "div.container", text: "Some Content"
  end

  Railsboot::ContainerComponent::BREAKPOINTS.each do |bpoint|
    test "renders #{bpoint} breakpoint" do
      render_inline(Railsboot::ContainerComponent.new(breakpoint: bpoint)) { "#{bpoint} Container Component" }
      assert_selector "div.container-#{bpoint}", text: "#{bpoint} Container Component"
    end
  end

  test "renders fluid container" do
    render_inline(Railsboot::ContainerComponent.new(fluid: true)) { "Fluid Container Component" }
    assert_selector "div.container-fluid", text: "Fluid Container Component"
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::ContainerComponent.new(id: "my-id", class: "my-class")) { "Container Component" }
    assert_selector "div.my-class"
    assert_selector "div#my-id"
  end
end
