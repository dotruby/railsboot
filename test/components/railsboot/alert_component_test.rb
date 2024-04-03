require "test_helper"

class Railsboot::BadgeComponentTest < Minitest::Test
  include Railsboot::ComponentTestHelpers

  def test_renders_content_within_alert
    render_inline(Railsboot::AlertComponent.new) { "Default" }
    assert_selector "div.alert", text: "Default"
  end

  Railsboot::AlertComponent::COLORS.each do |color|
    define_method "test_renders_#{color}_color" do
      render_inline(Railsboot::AlertComponent.new(color: color)) { "#{color} alert" }
      assert_selector "div.alert.alert-#{color}", text: "#{color} alert"
    end
  end

  def test_raises_on_wrong_color
    assert_raises(ArgumentError) do
      render_inline(Railsboot::AlertComponent.new(color: "unknown")) { "Unknown Color" }
    end
  end

  def test_renders_dismissable_alert
    render_inline(Railsboot::AlertComponent.new(dismissible: true)) { "Dismissable alert" }
    assert_selector "div.alert-dismissible.fade.show", text: "Dismissable alert"
  end

  def test_sets_the_role_attribute
    render_inline(Railsboot::AlertComponent.new) { "Alert Component" }
    assert_selector "div[role='alert']"
  end

  def test_allows_any_additional_html_attribute
    render_inline(Railsboot::AlertComponent.new(id: "my-id", class: "my-class")) { "Alert Component" }
    assert_selector "div.my-class"
    assert_selector "div#my-id"
  end
end
