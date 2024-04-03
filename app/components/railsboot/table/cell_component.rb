class Railsboot::Table::CellComponent < Railsboot::Component
  TAGS = ["th", "td"].freeze
  DEFAULT_TAG = "td".freeze

  def initialize(tag: DEFAULT_TAG, **html_attributes)
    @tag = fetch_or_raise(tag, TAGS)
    @html_attributes = html_attributes
  end

  def call
    content_tag @tag, content, **@html_attributes
  end
end
