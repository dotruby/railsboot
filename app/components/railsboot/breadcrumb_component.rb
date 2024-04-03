class Railsboot::BreadcrumbComponent < Railsboot::Component
  renders_many :items, Railsboot::Breadcrumb::ItemComponent

  def initialize(wrapper_attributes: {}, **html_attributes)
    @wrapper_attributes = wrapper_attributes
    @html_attributes = html_attributes

    @html_attributes[:tag] = "nav"
    @html_attributes[:class] = class_names(
      html_attributes.delete(:class)
    ).presence

    @wrapper_attributes[:tag] = "ol"
    @wrapper_attributes[:class] = class_names(
      "breadcrumb",
      wrapper_attributes.delete(:class)
    )
  end

  private

  def before_render
    @html_attributes["aria-label"] = "breadcrumb"
  end
end
