class Railsboot::Dropdown::ActionComponent < Railsboot::Component
  TYPES = ["button", "link"].freeze
  DEFAULT_TYPE = "button".freeze

  def initialize(text: "", type: DEFAULT_TYPE, variant: Railsboot::ButtonComponent::DEFAULT_VARIANT, **html_attributes)
    @text = text
    @variant = variant
    @type = fetch_or_raise(type, TYPES)
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "dropdown-toggle",
      html_attributes.delete(:class)
    )
  end

  def button?
    @type == "button"
  end

  def link?
    @type == "link"
  end

  private

  def before_render
    @html_attributes["data-bs-toggle"] = "dropdown"
    @html_attributes["aria-expanded"] = "false"
  end
end
