class Railsboot::PaginationComponent < Railsboot::Component
  def initialize(pagy:)
    @pagy = pagy
  end

  def render?
    @pagy.present? && @pagy.pages.to_i > 1
  end
end
