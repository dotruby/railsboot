require "test_helper"

class Railsboot::HeadingComponentTest < Minitest::Test
  include Railsboot::ComponentTestHelpers

  def test_renders_content_within_heading_with_a_h1_as_default
    render_inline(Railsboot::HeadingComponent.new) { "Heading Component" }
    assert_selector "h1", text: "Heading Component"
  end

  Railsboot::HeadingComponent::TAGS.each do |tag|
    define_method "test_renders_#{tag}_as_the_headline_tag" do
      render_inline(Railsboot::HeadingComponent.new(tag: tag)) { "#{tag} Heading Component" }
      assert_selector tag.to_s, text: "#{tag} Heading Component"
    end
  end

  def test_raises_on_wrong_tag
    assert_raises(ArgumentError) do
      render_inline(Railsboot::HeadingComponent.new(tag: "p")) { "Unknown Tag" }
    end
  end

  Railsboot::HeadingComponent::SIZES.each do |size|
    define_method "test_renders_#{size}_size_as_the_class" do
      render_inline(Railsboot::HeadingComponent.new(tag: "h2", size: size)) { "Size #{size} Heading Component" }
      assert_selector "h2.#{size}", text: "Size #{size} Heading Component"
    end
  end

  def test_falls_back_to_tag_size_if_custom_size_is_not_valid
    render_inline(Railsboot::HeadingComponent.new(tag: "h5", size: "h10")) { "Heading Component" }
    assert_selector "h5", text: "Heading Component"
  end

  Railsboot::HeadingComponent::DISPLAYS.each do |display|
    define_method "test_renders_#{display}_display_as_the_class" do
      render_inline(Railsboot::HeadingComponent.new(display: display)) { "Display #{display} Heading Component" }
      assert_selector "h1.display-#{display}", text: "Display #{display} Heading Component"
    end
  end

  def test_allows_any_additional_html_attribute
    render_inline(Railsboot::HeadingComponent.new(id: "my-id", class: "my-class")) { "Heading Component" }
    assert_selector "h1.my-class"
    assert_selector "h1#my-id"
  end
end
