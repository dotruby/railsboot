class Railsboot::Button::ButtonComponent < Railsboot::ButtonComponent
  def initialize(**html_attributes)
    super(tag: "button", **html_attributes)
  end
end
