require "test_helper"

class Railsboot::ToastComponentTest < ViewComponent::TestCase
  test "renders toast component as the default" do
    render_inline(Railsboot::ToastComponent.new)
    assert_selector "div.toast"
  end

  test "sets correct role attribute" do
    render_inline(Railsboot::ToastComponent.new)
    assert_selector "div[role='alert']"
  end

  test "sets correct aria attributes" do
    render_inline(Railsboot::ToastComponent.new)
    assert_selector "div[aria-live='assertive']"
    assert_selector "div[aria-atomic='true']"
  end

  test "allows any additional html_attribute" do
    render_inline(Railsboot::ToastComponent.new(id: "my-id", class: "my-class"))
    assert_selector "div.toast.my-class"
    assert_selector "div#my-id"
  end
end
