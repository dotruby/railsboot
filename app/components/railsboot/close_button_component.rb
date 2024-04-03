class Railsboot::CloseButtonComponent < Railsboot::Component
  def initialize(disabled: false, **html_attributes)
    @disabled = disabled
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "btn-close",
      html_attributes.delete(:class)
    )
  end

  private

  def before_render
    @html_attributes["aria-label"] = "Close"
    @html_attributes["disabled"] = "disabled" if @disabled
  end
end
