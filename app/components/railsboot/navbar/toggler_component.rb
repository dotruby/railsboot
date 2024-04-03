class Railsboot::Navbar::TogglerComponent < Railsboot::Component
  def initialize(id:, **html_attributes)
    @id = id
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "navbar-toggler",
      html_attributes.delete(:class)
    )
  end

  private

  def before_render
    @html_attributes["type"] = "button"
    @html_attributes["data-bs-toggle"] = "collapse"
    @html_attributes["data-bs-target"] = "##{@id}"
    @html_attributes["aria-controls"] = @id.to_s
    @html_attributes["aria-expanded"] = "false"
    @html_attributes["aria-label"] = "Toggle navigation"
  end
end
