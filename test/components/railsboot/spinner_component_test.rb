require "test_helper"

class Railsboot::SpinnerComponentTest < ViewComponent::TestCase
  def test_renders_spinner_border_with_primary_color_as_the_default
    render_inline(Railsboot::SpinnerComponent.new)
    assert_selector "div.spinner-border.text-primary"
  end

  Railsboot::SpinnerComponent::COLORS.each do |color|
    define_method "test_renders_#{color}_as_the_color" do
      render_inline(Railsboot::SpinnerComponent.new(color: color))
      assert_selector "div.spinner-border.text-#{color}"
    end
  end

  def test_raises_on_wrong_color_argument
    assert_raises(ArgumentError) do
      render_inline(Railsboot::SpinnerComponent.new(color: "whatever"))
    end
  end

  Railsboot::SpinnerComponent::STYLES.each do |style|
    define_method "test_renders_#{style}_as_the_style" do
      render_inline(Railsboot::SpinnerComponent.new(style: style))
      assert_selector "div.spinner-#{style}.text-primary"
    end
  end

  def test_raises_on_wrong_style_argument
    assert_raises(ArgumentError) do
      render_inline(Railsboot::SpinnerComponent.new(style: "whatever"))
    end
  end

  def test_sets_correct_role_attribute
    render_inline(Railsboot::SpinnerComponent.new)
    assert_selector "div[role='status']"
  end

  def test_renders_visually_hidden_span_inside
    render_inline(Railsboot::SpinnerComponent.new)
    assert_selector "div.spinner-border.text-primary" do
      assert_selector "span.visually-hidden", text: "Loading..."
    end
  end

  def test_allows_any_additional_html_attribute
    render_inline(Railsboot::SpinnerComponent.new(id: "my-id", class: "my-class"))
    assert_selector "div.my-class"
    assert_selector "div#my-id"
  end
end
