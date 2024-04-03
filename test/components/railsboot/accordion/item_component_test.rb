require "test_helper"

class Railsboot::Accordion::ItemComponentTest < ViewComponent::TestCase
  test "renders accordion item component" do
    render_inline(Railsboot::AccordionComponent.new) do |accordion|
      accordion.with_item(id: "item-1")
    end
    assert_selector "div.accordion" do
      assert_selector "div.accordion-item"
    end
  end

  test "renders header slot within the accordion item component" do
    render_inline(Railsboot::AccordionComponent.new) do |accordion|
      accordion.with_item(id: "item-1").with_header { "Header" }
    end
    assert_selector "div.accordion" do
      assert_selector "div.accordion-item" do
        assert_selector "h2.accordion-header > button.accordion-button.collapsed", text: "Header"
      end
    end
  end

  test "renders body slot within the accordion item component" do
    render_inline(Railsboot::AccordionComponent.new) do |accordion|
      accordion.with_item(id: "item-1").with_body { "Body" }
    end
    assert_selector "div.accordion" do
      assert_selector "div.accordion-item" do
        assert_selector "div.accordion-collapse.collapse" do
          assert_selector "div.accordion-body", text: "Body"
        end
      end
    end
  end

  test "expanded option sets relevant classes" do
    render_inline(Railsboot::AccordionComponent.new) do |accordion|
      accordion.with_item(id: "item-1", expanded: true) do |item|
        item.with_header { "Header" }
        item.with_body { "Body" }
      end
    end

    assert_selector "div.accordion" do
      assert_selector "div.accordion-item" do
        assert_selector "h2.accordion-header > button.accordion-button", text: "Header"
      end
    end

    assert_selector "div.accordion" do
      assert_selector "div.accordion-item" do
        assert_selector "div.accordion-collapse.collapse.show" do
          assert_selector "div.accordion-body", text: "Body"
        end
      end
    end
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::AccordionComponent.new) do |accordion|
      accordion.with_item(id: "item-id", class: "custom-class")
    end
    assert_selector "div.accordion" do
      assert_selector "div.accordion-item.custom-class"
    end
  end
end
