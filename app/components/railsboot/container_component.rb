class Railsboot::ContainerComponent < Railsboot::Component
  BREAKPOINTS = ["sm", "md", "lg", "xl", "xxl"].freeze
  DEFAULT_BREAKPOINT = "".freeze

  def initialize(breakpoint: DEFAULT_BREAKPOINT, fluid: false, **html_attributes)
    @breakpoint = breakpoint
    @fluid = fluid
    @html_attributes = html_attributes

    @html_attributes[:class] = class_names(
      ("container-#{breakpoint}" if @breakpoint.in?(BREAKPOINTS)),
      ("container-fluid" if @fluid),
      ("container" if @fluid.blank? && !@breakpoint.in?(BREAKPOINTS)),
      html_attributes.delete(:class)
    )
  end

  def call
    render Railsboot::BaseComponent.new(tag: "div", **@html_attributes) do
      content
    end
  end
end
