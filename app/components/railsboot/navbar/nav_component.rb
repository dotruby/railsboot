class Railsboot::Navbar::NavComponent < Railsboot::Component
  renders_many :items, Railsboot::Nav::ItemComponent

  def initialize(tag: "nav", **html_attributes)
    @tag = tag
    @html_attributes = html_attributes

    @html_attributes[:tag] = @tag
    @html_attributes[:class] = class_names(
      "navbar-nav",
      html_attributes.delete(:class)
    )
  end
end
