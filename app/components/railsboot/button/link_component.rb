class Railsboot::Button::LinkComponent < Railsboot::ButtonComponent
  def initialize(**html_attributes)
    super(tag: "a", **html_attributes)
  end
end
