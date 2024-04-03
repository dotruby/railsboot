class Railsboot::OffcanvasComponent < Railsboot::Component
  PLACEMENTS = ["start", "end", "top", "bottom"].freeze
  DEFAULT_PLACEMENT = "start".freeze

  renders_one :header, Railsboot::Offcanvas::HeaderComponent
  renders_one :body, Railsboot::Offcanvas::BodyComponent

  def initialize(placement: DEFAULT_PLACEMENT, **html_attributes)
    @placement = fetch_or_fallback(placement, PLACEMENTS, DEFAULT_PLACEMENT)
    @html_attributes = html_attributes

    @html_attributes[:tag] = "div"
    @html_attributes[:class] = class_names(
      "offcanvas",
      "offcanvas-#{@placement}",
      html_attributes.delete(:class)
    )
  end

  private

  def before_render
    @html_attributes["tabindex"] = "-1"
  end
end
