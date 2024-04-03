class Railsboot::Modal::BodyComponent < Railsboot::Component
  def initialize(**html_attributes)
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "modal-body",
      html_attributes.delete(:class)
    )
  end

  def call
    render(Railsboot::BaseComponent.new(tag: "div", **@html_attributes)) { content }
  end
end
