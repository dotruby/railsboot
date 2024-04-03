require "test_helper"

class Railsboot::BreadcrumbComponentTest < Minitest::Test
  include Railsboot::ComponentTestHelpers

  def test_renders_default_breadcrumb_code
    render_inline(Railsboot::BreadcrumbComponent.new)
    assert_selector "nav > ol.breadcrumb"
  end

  def test_sets_correct_aria_label_attribute
    render_inline(Railsboot::BreadcrumbComponent.new)
    assert_selector "nav[aria-label='breadcrumb']"
  end

  def test_allows_any_additional_html_attribute
    render_inline(Railsboot::BreadcrumbComponent.new(id: "custom-id", class: "custom-class"))
    assert_selector "nav.custom-class"
    assert_selector "nav#custom-id"
  end

  def test_allows_any_additional_html_attribute_for_the_wrapping_element
    render_inline(Railsboot::BreadcrumbComponent.new(wrapper_attributes: {id: "custom-id", class: "custom-class"}))
    assert_selector "ol.breadcrumb.custom-class"
    assert_selector "ol.breadcrumb#custom-id"
  end
end
