class Railsboot::ButtonComponent < Railsboot::Component
  TAGS = ["button", "a", "input"].freeze
  DEFAULT_TAG = "button".freeze

  VARIANTS = (COLORS + ["link"]).freeze
  DEFAULT_VARIANT = DEFAULT_COLOR

  SIZES = ["", "lg", "sm"].freeze
  DEFAULT_SIZE = "".freeze

  def initialize(text: "", href: "", tag: DEFAULT_TAG, variant: DEFAULT_VARIANT, size: DEFAULT_SIZE, outline: false, form: nil, **html_attributes)
    @tag = fetch_or_raise(tag, TAGS)
    @text = text
    @href = href
    @variant = fetch_or_raise(variant, VARIANTS)
    @outline = outline
    @size = fetch_or_fallback(size, SIZES, DEFAULT_SIZE)
    @form = form
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      "btn",
      ["btn", ("outline" if @outline), @variant].compact_blank.join("-"),
      {"btn-#{@size}" => @size.present?},
      html_attributes.delete(:class)
    )
  end

  def button?
    @tag == "button"
  end

  def link?
    @tag == "a"
  end

  def input?
    @tag == "input"
  end

  private

  def before_render
    if input?
      @html_attributes["type"] = "submit"
      @html_attributes["value"] = @text.presence || content
    end
  end
end
