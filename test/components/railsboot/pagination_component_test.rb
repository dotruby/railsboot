require "test_helper"

class Railsboot::PraginationComponentTest < ViewComponent::TestCase
  test "renders pagy bootstrap class structure" do
    pagy = Pagy.new({count: 50, page: 1})
    render_inline(Railsboot::PaginationComponent.new(pagy: pagy))
    assert_selector "nav.pagy-bootstrap-nav"
  end
end
