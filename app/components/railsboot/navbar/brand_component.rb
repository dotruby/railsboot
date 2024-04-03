class Railsboot::Navbar::BrandComponent < Railsboot::Component
  def initialize(tag: "a", **html_attributes)
    @tag = tag
    @html_attributes = html_attributes

    @html_attributes[:tag] = @tag
    @html_attributes[:class] = class_names(
      "navbar-brand",
      html_attributes.delete(:class)
    )
  end

  def call
    render(Railsboot::BaseComponent.new(**@html_attributes)) { content }
  end
end
