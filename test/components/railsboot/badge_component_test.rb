require "test_helper"

class Railsboot::BadgeComponentTest < ViewComponent::TestCase
  test "renders content within badge" do
    render_inline(Railsboot::BadgeComponent.new) { "Badge Component" }
    assert_selector "span.badge", text: "Badge Component"
  end

  Railsboot::BadgeComponent::COLORS.each do |color|
    test "renders #{color} color" do
      render_inline(Railsboot::BadgeComponent.new(color: color)) { "#{color} Badge Component" }
      assert_selector "span.badge.bg-#{color}", text: "#{color} Badge Component"
    end
  end

  test "raises on wrong color" do
    assert_raises(ArgumentError) do
      render_inline(Railsboot::BadgeComponent.new(color: "unknown")) { "Unknown Color" }
    end
  end

  test "renders pill badge" do
    render_inline(Railsboot::BadgeComponent.new(pill: true)) { "Pill Badge Component" }
    assert_selector "span.badge.rounded-pill", text: "Pill Badge Component"
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::BadgeComponent.new(id: "my-id", class: "my-class")) { "Badge Component" }
    assert_selector "span.my-class"
    assert_selector "span#my-id"
  end
end
