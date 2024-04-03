require "test_helper"

class Railsboot::Table::CellComponentTest < ViewComponent::TestCase
  test "renders table cell component with a td the default" do
    render_inline(Railsboot::TableComponent.new) do |table|
      table.with_body do |body|
        body.with_row do |row|
          row.with_cell { "Test" }
        end
      end
    end
    assert_selector "table.table > tbody > tr" do
      assert_selector "td", text: "Test"
    end
  end

  test "allows a th as the html element" do
    render_inline(Railsboot::TableComponent.new) do |table|
      table.with_body do |body|
        body.with_row do |row|
          row.with_cell(tag: "th") { "Test" }
        end
      end
    end
    assert_selector "table.table > tbody > tr" do
      assert_selector "th", text: "Test"
    end
  end

  test "raises if a wrong tag is supplied" do
    assert_raises(ArgumentError) do
      render_inline(Railsboot::TableComponent.new) do |table|
        table.with_body do |body|
          body.with_row do |row|
            row.with_cell(tag: "whatever") { "Test" }
          end
        end
      end
    end
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::TableComponent.new) do |table|
      table.with_body do |body|
        body.with_row do |row|
          row.with_cell(id: "custom-id", class: "custom-class") { "Test" }
        end
      end
    end
    assert_selector "table.table > tbody > tr" do
      assert_selector "td.custom-class"
      assert_selector "td#custom-id"
    end
  end
end
