require "test_helper"

class Railsboot::Table::RowComponentTest < ViewComponent::TestCase
  test "renders table row component as the default" do
    render_inline(Railsboot::TableComponent.new) do |table|
      table.with_body do |body|
        body.with_row { "Test" }
      end
    end
    assert_selector "table.table" do
      assert_selector "tbody" do
        assert_selector "tr", text: "Test"
      end
    end
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::TableComponent.new) do |table|
      table.with_body do |body|
        body.with_row(id: "custom-id", class: "custom-class") { "Test" }
      end
    end
    assert_selector "table.table" do
      assert_selector "tbody" do
        assert_selector "tr.custom-class"
        assert_selector "tr#custom-id"
      end
    end
  end
end
