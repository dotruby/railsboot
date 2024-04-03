require "test_helper"

class Railsboot::BreadcrumbComponentTest < ViewComponent::TestCase
  test "renders default breadcrumb code" do
    render_inline(Railsboot::BreadcrumbComponent.new)
    assert_selector "nav > ol.breadcrumb"
  end

  test "sets correct aria label attribute" do
    render_inline(Railsboot::BreadcrumbComponent.new)
    assert_selector "nav[aria-label='breadcrumb']"
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::BreadcrumbComponent.new(id: "custom-id", class: "custom-class"))
    assert_selector "nav.custom-class"
    assert_selector "nav#custom-id"
  end

  test "allows any additional html attribute for the wrapping element" do
    render_inline(Railsboot::BreadcrumbComponent.new(wrapper_attributes: {id: "custom-id", class: "custom-class"}))
    assert_selector "ol.breadcrumb.custom-class"
    assert_selector "ol.breadcrumb#custom-id"
  end
end
