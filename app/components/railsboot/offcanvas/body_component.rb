class Railsboot::Offcanvas::BodyComponent < Railsboot::Component
  def initialize(**html_attributes)
    @html_attributes = html_attributes

    @html_attributes[:tag] = "div"
    @html_attributes[:class] = class_names(
      "offcanvas-body",
      html_attributes.delete(:class)
    )
  end

  def call
    render(Railsboot::BaseComponent.new(**@html_attributes)) { content }
  end
end
