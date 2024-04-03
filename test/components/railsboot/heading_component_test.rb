require "test_helper"

class Railsboot::HeadingComponentTest < ViewComponent::TestCase
  test "renders content within heading with a h1 as default" do
    render_inline(Railsboot::HeadingComponent.new) { "Heading Component" }
    assert_selector "h1", text: "Heading Component"
  end

  Railsboot::HeadingComponent::TAGS.each do |tag|
    test "renders #{tag} as the headline tag" do
      render_inline(Railsboot::HeadingComponent.new(tag: tag)) { "#{tag} Heading Component" }
      assert_selector tag.to_s, text: "#{tag} Heading Component"
    end
  end

  test "raises on wrong tag" do
    assert_raises(ArgumentError) do
      render_inline(Railsboot::HeadingComponent.new(tag: "p")) { "Unknown Tag" }
    end
  end

  Railsboot::HeadingComponent::SIZES.each do |size|
    test "renders #{size} size as the class" do
      render_inline(Railsboot::HeadingComponent.new(tag: "h2", size: size)) { "Size #{size} Heading Component" }
      assert_selector "h2.#{size}", text: "Size #{size} Heading Component"
    end
  end

  test "falls back to tag size if custom size is not valid" do
    render_inline(Railsboot::HeadingComponent.new(tag: "h5", size: "h10")) { "Heading Component" }
    assert_selector "h5", text: "Heading Component"
  end

  Railsboot::HeadingComponent::DISPLAYS.each do |display|
    test "renders #{display} display as the class" do
      render_inline(Railsboot::HeadingComponent.new(display: display)) { "Display #{display} Heading Component" }
      assert_selector "h1.display-#{display}", text: "Display #{display} Heading Component"
    end
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::HeadingComponent.new(id: "custom-id", class: "custom-class")) { "Heading Component" }
    assert_selector "h1.custom-class"
    assert_selector "h1#custom-id"
  end
end
