require "test_helper"

class Railsboot::BadgeComponentTest < Minitest::Test
  include Railsboot::ComponentTestHelpers

  def test_renders_content_within_badge
    render_inline(Railsboot::BadgeComponent.new) { "Badge Component" }
    assert_selector "span.badge", text: "Badge Component"
  end

  Railsboot::BadgeComponent::COLORS.each do |color|
    define_method "test_renders_#{color}_color" do
      render_inline(Railsboot::BadgeComponent.new(color: color)) { "#{color} Badge Component" }
      assert_selector "span.badge.bg-#{color}", text: "#{color} Badge Component"
    end
  end

  def test_raises_on_wrong_color
    assert_raises(ArgumentError) do
      render_inline(Railsboot::BadgeComponent.new(color: "unknown")) { "Unknown Color" }
    end
  end

  def test_renders_pill_badge
    render_inline(Railsboot::BadgeComponent.new(pill: true)) { "Pill Badge Component" }
    assert_selector "span.badge.rounded-pill", text: "Pill Badge Component"
  end

  def test_allows_any_additional_html_attribute
    render_inline(Railsboot::BadgeComponent.new(id: "my-id", class: "my-class")) { "Badge Component" }
    assert_selector "span.my-class"
    assert_selector "span#my-id"
  end
end
