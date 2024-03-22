class Railsboot::BaseComponent < Railsboot::Component
  def initialize(tag:, **html_attributes)
    @tag = tag
    @html_attributes = html_attributes
  end
end
