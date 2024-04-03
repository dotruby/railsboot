class Railsboot::Modal::HeaderComponent < Railsboot::Component
  def initialize(**html_attributes)
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "modal-header",
      html_attributes.delete(:class)
    )
  end
end
