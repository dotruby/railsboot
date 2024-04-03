require "test_helper"

class Railsboot::PraginationComponentTest < Minitest::Test
  include Railsboot::ComponentTestHelpers

  def test_renders_pagy_bootstrap_class_structure
    pagy = Pagy.new({count: 50, page: 1})
    render_inline(Railsboot::PaginationComponent.new(pagy: pagy))
    assert_selector "nav.pagy-bootstrap-nav"
  end
end
