class Railsboot::Button::InputComponent < Railsboot::ButtonComponent
  def initialize(**html_attributes)
    super(tag: "input", **html_attributes)
  end
end
