require "test_helper"

class Railsboot::Toast::HeaderComponentTest < ViewComponent::TestCase
  test "renders toast-header class as the default" do
    render_inline(Railsboot::ToastComponent.new) do |toast|
      toast.with_header { "Hello from the header!" }
    end
    assert_selector "div.toast" do
      assert_selector "div.toast-header", text: "Hello from the header!"
    end
  end

  test "renders close button as well" do
    render_inline(Railsboot::ToastComponent.new) do |toast|
      toast.with_header { "Hello from the header!" }
    end
    assert_selector "div.toast" do
      assert_selector "button.btn-close"
    end
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::ToastComponent.new) do |toast|
      toast.with_header(id: "custom-id", class: "custom-class") { "Hello from the header!" }
    end
    assert_selector "div.toast" do
      assert_selector "div.toast-header.custom-class"
      assert_selector "div.toast-header#custom-id"
    end
  end
end
