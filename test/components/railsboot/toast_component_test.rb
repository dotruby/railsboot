require "test_helper"

class Railsboot::ToastComponentTest < Minitest::Test
  include Railsboot::ComponentTestHelpers

  def test_renders_toast_component_as_the_default
    render_inline(Railsboot::ToastComponent.new)
    assert_selector "div.toast"
  end

  def test_sets_correct_role_attribute
    render_inline(Railsboot::ToastComponent.new)
    assert_selector "div[role='alert']"
  end

  def test_sets_correct_aria_attributes
    render_inline(Railsboot::ToastComponent.new)
    assert_selector "div[aria-live='assertive']"
    assert_selector "div[aria-atomic='true']"
  end

  def test_allows_any_additional_html_attribute
    render_inline(Railsboot::ToastComponent.new(id: "my-id", class: "my-class"))
    assert_selector "div.toast.my-class"
    assert_selector "div#my-id"
  end
end
