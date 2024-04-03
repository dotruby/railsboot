require "test_helper"

class Railsboot::AccordionComponentTest < ViewComponent::TestCase
  test "renders accordion component as the default" do
    render_inline(Railsboot::AccordionComponent.new)
    assert_selector "div.accordion"
  end

  test "renders flush class if flush boolean is true" do
    render_inline(Railsboot::AccordionComponent.new(flush: true))
    assert_selector "div.accordion.accordion-flush"
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::AccordionComponent.new(id: "my-id", class: "my-class"))
    assert_selector "div.accordion.my-class"
    assert_selector "div.accordion#my-id"
  end
end
