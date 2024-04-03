require "test_helper"

class Railsboot::Breadcrumb::ItemComponentTest < ViewComponent::TestCase
  test "renders breadcrumb-item class as the default" do
    render_inline(Railsboot::BreadcrumbComponent.new) do |breadcrumb|
      breadcrumb.with_item(text: "Item 1", href: "#")
    end
    assert_selector "nav > ol.breadcrumb" do
      assert_selector "li.breadcrumb-item", text: "Item 1"
    end
  end

  test "renders correct href attribute" do
    render_inline(Railsboot::BreadcrumbComponent.new) do |breadcrumb|
      breadcrumb.with_item(text: "Item 1", href: "https://rubyonrails.org")
    end
    assert_selector "nav > ol.breadcrumb" do
      assert_selector "li.breadcrumb-item > a[href='https://rubyonrails.org']"
    end
  end

  test "renders text attribute inside link if href is present" do
    render_inline(Railsboot::BreadcrumbComponent.new) do |breadcrumb|
      breadcrumb.with_item(text: "Item 1", href: "https://rubyonrails.org")
    end
    assert_selector "nav > ol.breadcrumb" do
      assert_selector "li.breadcrumb-item > a[href='https://rubyonrails.org']", text: "Item 1"
    end
  end

  test "sets active attributes" do
    render_inline(Railsboot::BreadcrumbComponent.new) do |breadcrumb|
      breadcrumb.with_item(text: "Item 1", active: true)
    end
    assert_selector "nav > ol.breadcrumb" do
      assert_selector "li.breadcrumb-item.active", text: "Item 1"
      assert_selector "li.breadcrumb-item.active[aria-current='page']"
    end
  end

  test "allows any additional html attribute" do
    render_inline(Railsboot::BreadcrumbComponent.new) do |breadcrumb|
      breadcrumb.with_item(text: "Item 1", href: "#", id: "custom-id", class: "custom-class")
    end
    assert_selector "nav > ol.breadcrumb" do
      assert_selector "li.breadcrumb-item.custom-class"
      assert_selector "li.breadcrumb-item#custom-id"
    end
  end
end
