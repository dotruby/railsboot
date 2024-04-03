require "test_helper"

class Railsboot::CloseButtonComponentTest < Minitest::Test
  include Railsboot::ComponentTestHelpers

  def test_renders_the_close_button
    render_inline(Railsboot::CloseButtonComponent.new)
    assert_selector "button.btn-close"
  end

  def test_sets_correct_aria_label_attribute
    render_inline(Railsboot::CloseButtonComponent.new)
    assert_selector "button[aria-label='Close']"
  end

  def test_sets_disabled_html_attribute_if_disabled_is_true
    render_inline(Railsboot::CloseButtonComponent.new(disabled: true))
    assert_selector "button[disabled='disabled']"
  end

  def test_allows_any_additional_html_attribute
    render_inline(Railsboot::CloseButtonComponent.new(id: "my-id", class: "my-class"))
    assert_selector "button.my-class"
    assert_selector "button#my-id"
  end
end
