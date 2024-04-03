class Railsboot::HeadingComponent < Railsboot::Component
  TAGS = ["h1", "h2", "h3", "h4", "h5", "h6", "div", "span"].freeze
  DEFAULT_TAG = "h1".freeze

  SIZES = ["h1", "h2", "h3", "h4", "h5", "h6"].freeze
  DISPLAYS = ["1", "2", "3", "4", "5", "6"].freeze

  def initialize(tag: DEFAULT_TAG, size: nil, display: nil, **html_attributes)
    @tag = fetch_or_raise(tag, TAGS)
    @size = size.to_s if size.present? && SIZES.include?(size.to_s)
    @display = display.to_s if display.present? && DISPLAYS.include?(display.to_s)
    @html_attributes = html_attributes

    @html_attributes[:tag] = @tag
    @html_attributes[:class] = class_names(
      {@size => @size.present?},
      {"display-#{@display}" => @display.present?},
      html_attributes.delete(:class)
    ).presence
  end
end
