class Railsboot::ModalComponent < Railsboot::Component
  SIZES = ["", "xl", "lg", "sm"].freeze
  DEFAULT_SIZE = "".freeze

  renders_one :header, Railsboot::Modal::HeaderComponent
  renders_one :body, Railsboot::Modal::BodyComponent
  renders_one :footer, Railsboot::Modal::FooterComponent

  def initialize(size: DEFAULT_SIZE, fade: true, **html_attributes)
    @size = fetch_or_fallback(size, SIZES, DEFAULT_SIZE)
    @fade = fade
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "modal",
      {"fade" => @fade.present?},
      html_attributes.delete(:class)
    )
  end

  private

  def before_render
    @html_attributes["tabindex"] = "-1"
    @html_attributes["aria-hidden"] = "true"
  end
end
