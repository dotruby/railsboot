class Railsboot::Toast::HeaderComponent < Railsboot::Component
  def initialize(**html_attributes)
    @html_attributes = html_attributes

    @html_attributes[:tag] = "div"
    @html_attributes[:class] = class_names(
      "toast-header",
      html_attributes.delete(:class)
    )
  end

  def call
    render(Railsboot::BaseComponent.new(**@html_attributes)) do
      content.to_s + render(Railsboot::CloseButtonComponent.new(data: {bs_dismiss: "toast"}))
    end
  end
end
