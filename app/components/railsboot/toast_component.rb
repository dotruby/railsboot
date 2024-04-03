class Railsboot::ToastComponent < Railsboot::Component
  renders_one :header, Railsboot::Toast::HeaderComponent
  renders_one :body, Railsboot::Toast::BodyComponent

  def initialize(**html_attributes)
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "toast",
      html_attributes.delete(:class)
    )
  end

  private

  def before_render
    @html_attributes["role"] = "alert"
    @html_attributes["aria-live"] = "assertive"
    @html_attributes["aria-atomic"] = "true"
  end
end
