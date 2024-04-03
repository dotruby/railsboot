require "test_helper"

class Railsboot::ProgressComponentTest < ViewComponent::TestCase
  def test_renders_progress_with_primary_color_as_the_default
    render_inline(Railsboot::ProgressComponent.new)
    assert_selector "div.progress > div.progress-bar"
  end

  def test_sets_the_width_of_the_inner_progress_div
    render_inline(Railsboot::ProgressComponent.new(value: 33))
    assert_selector "div[style='width: 33%']"
  end

  Railsboot::SpinnerComponent::COLORS.each do |color|
    define_method "test_renders_#{color}_as_the_color" do
      render_inline(Railsboot::ProgressComponent.new(color: color))
      assert_selector "div.progress > div.progress-bar.bg-#{color}"
    end
  end

  def test_raises_on_wrong_color_argument
    assert_raises(ArgumentError) do
      render_inline(Railsboot::ProgressComponent.new(color: "whatever"))
    end
  end

  def test_sets_correct_role_attribute
    render_inline(Railsboot::ProgressComponent.new)
    assert_selector "div[role='progressbar']"
  end

  def test_renders_the_correct_aria_values_for_the_given_attributes
    render_inline(Railsboot::ProgressComponent.new(value: 50, min: 0, max: 100))
    assert_selector "div[aria-valuenow=50]"
    assert_selector "div[aria-valuemin=0]"
    assert_selector "div[aria-valuemax=100]"
  end

  def test_renders_a_custom_aria_label_if_it_is_passed_in
    render_inline(Railsboot::ProgressComponent.new(aria_label: "My Progress Bar"))
    assert_selector "div[aria-label='My Progress Bar']"
  end

  def test_allows_any_additional_html_attribute
    render_inline(Railsboot::ProgressComponent.new(id: "my-id", class: "my-class"))
    assert_selector "div.my-class"
    assert_selector "div#my-id"
  end
end
