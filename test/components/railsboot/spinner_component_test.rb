require "test_helper"

class Railsboot::SpinnerComponentTest < ViewComponent::TestCase
  test "renders spinner border with primary color as the default" do
    render_inline(Railsboot::SpinnerComponent.new)
    assert_selector "div.spinner-border.text-primary"
  end

  Railsboot::SpinnerComponent::COLORS.each do |color|
    test "renders #{color} as the color" do
      render_inline(Railsboot::SpinnerComponent.new(color: color))
      assert_selector "div.spinner-border.text-#{color}"
    end
  end

  test "raises on wrong color argument" do
    assert_raises(ArgumentError) do
      render_inline(Railsboot::SpinnerComponent.new(color: "whatever"))
    end
  end

  Railsboot::SpinnerComponent::STYLES.each do |style|
    test "renders #{style} as the style" do
      render_inline(Railsboot::SpinnerComponent.new(style: style))
      assert_selector "div.spinner-#{style}.text-primary"
    end
  end

  test "raises on wrong style argument" do
    assert_raises(ArgumentError) do
      render_inline(Railsboot::SpinnerComponent.new(style: "whatever"))
    end
  end

  test "sets correct role attribute" do
    render_inline(Railsboot::SpinnerComponent.new)
    assert_selector "div[role='status']"
  end

  test "renders visually hidden span inside" do
    render_inline(Railsboot::SpinnerComponent.new)
    assert_selector "div.spinner-border.text-primary" do
      assert_selector "span.visually-hidden", text: "Loading..."
    end
  end

  test "allows any additional html_attribute" do
    render_inline(Railsboot::SpinnerComponent.new(id: "custom-id", class: "custom-class"))
    assert_selector "div.custom-class"
    assert_selector "div#custom-id"
  end
end
