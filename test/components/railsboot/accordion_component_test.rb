require "test_helper"

class Railsboot::AccordionComponentTest < Minitest::Test
  include Railsboot::ComponentTestHelpers

  def test_renders_accordion_component_as_the_default
    render_inline(Railsboot::AccordionComponent.new)
    assert_selector "div.accordion"
  end

  def test_renders_flush_class_if_flush_boolean_is_true
    render_inline(Railsboot::AccordionComponent.new(flush: true))
    assert_selector "div.accordion.accordion-flush"
  end

  def test_allows_any_additional_html_attribute
    render_inline(Railsboot::AccordionComponent.new(id: "my-id", class: "my-class"))
    assert_selector "div.accordion.my-class"
    assert_selector "div.accordion#my-id"
  end
end
