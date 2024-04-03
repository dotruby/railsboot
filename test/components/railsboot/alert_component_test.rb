require "test_helper"

class Railsboot::AlertComponentTest < ViewComponent::TestCase
  test "renders content within alert" do
    render_inline(Railsboot::AlertComponent.new) { "Default" }
    assert_selector "div.alert", text: "Default"
  end

  Railsboot::AlertComponent::COLORS.each do |color|
    test "renders #{color} color" do
      render_inline(Railsboot::AlertComponent.new(color: color)) { "#{color} alert" }
      assert_selector "div.alert.alert-#{color}", text: "#{color} alert"
    end
  end

  test "raises on wrong color" do
    assert_raises(ArgumentError) do
      render_inline(Railsboot::AlertComponent.new(color: "unknown")) { "Unknown Color" }
    end
  end

  test "renders dismissable alert" do
    render_inline(Railsboot::AlertComponent.new(dismissible: true)) { "Dismissable alert" }
    assert_selector "div.alert-dismissible.fade.show", text: "Dismissable alert"
  end

  test "sets the role attribute" do
    render_inline(Railsboot::AlertComponent.new) { "Alert Component" }
    assert_selector "div[role='alert']"
  end

  test "allows any additional html_attribute" do
    render_inline(Railsboot::AlertComponent.new(id: "my-id", class: "my-class")) { "Alert Component" }
    assert_selector "div.my-class"
    assert_selector "div#my-id"
  end
end
