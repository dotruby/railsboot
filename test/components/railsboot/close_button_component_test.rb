require "test_helper"

class Railsboot::CloseButtonComponentTest < ViewComponent::TestCase
  test "renders the close button" do
    render_inline(Railsboot::CloseButtonComponent.new)
    assert_selector "button.btn-close"
  end

  test "sets correct aria label attribute" do
    render_inline(Railsboot::CloseButtonComponent.new)
    assert_selector "button[aria-label='Close']"
  end

  test "sets disabled html attribute if disabled is true" do
    render_inline(Railsboot::CloseButtonComponent.new(disabled: true))
    assert_selector "button[disabled='disabled']"
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::CloseButtonComponent.new(id: "custom-id", class: "custom-class"))
    assert_selector "button.custom-class"
    assert_selector "button#custom-id"
  end
end
