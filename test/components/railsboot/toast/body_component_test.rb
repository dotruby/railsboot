require "test_helper"

class Railsboot::Toast::BodyComponentTest < ViewComponent::TestCase
  test "renders toast-body class as the default" do
    render_inline(Railsboot::ToastComponent.new) do |toast|
      toast.with_body { "Hello from the body!" }
    end
    assert_selector "div.toast" do
      assert_selector "div.toast-body", text: "Hello from the body!"
    end
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::ToastComponent.new) do |toast|
      toast.with_body(id: "custom-id", class: "custom-class") { "Hello from the body!" }
    end
    assert_selector "div.toast" do
      assert_selector "div.toast-body.custom-class"
      assert_selector "div.toast-body#custom-id"
    end
  end
end
