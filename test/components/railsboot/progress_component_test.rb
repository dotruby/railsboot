require "test_helper"

class Railsboot::ProgressComponentTest < ViewComponent::TestCase
  test "renders progress with primary color as the default" do
    render_inline(Railsboot::ProgressComponent.new)
    assert_selector "div.progress > div.progress-bar"
  end

  test "sets the width of the inner progress div" do
    render_inline(Railsboot::ProgressComponent.new(value: 33))
    assert_selector "div[style='width: 33%']"
  end

  Railsboot::SpinnerComponent::COLORS.each do |color|
    test "renders #{color} as the color" do
      render_inline(Railsboot::ProgressComponent.new(color: color))
      assert_selector "div.progress > div.progress-bar.bg-#{color}"
    end
  end

  test "raises on wrong color argument" do
    assert_raises(ArgumentError) do
      render_inline(Railsboot::ProgressComponent.new(color: "whatever"))
    end
  end

  test "sets correct role attribute" do
    render_inline(Railsboot::ProgressComponent.new)
    assert_selector "div[role='progressbar']"
  end

  test "renders the correct aria values for the given attributes" do
    render_inline(Railsboot::ProgressComponent.new(value: 50, min: 0, max: 100))
    assert_selector "div[aria-valuenow=50]"
    assert_selector "div[aria-valuemin=0]"
    assert_selector "div[aria-valuemax=100]"
  end

  test "renders a custom aria label if it is passed in" do
    render_inline(Railsboot::ProgressComponent.new(aria_label: "My Progress Bar"))
    assert_selector "div[aria-label='My Progress Bar']"
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::ProgressComponent.new(id: "my-id", class: "my-class"))
    assert_selector "div.my-class"
    assert_selector "div#my-id"
  end
end
