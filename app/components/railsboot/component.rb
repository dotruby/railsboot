# parent class for all bootstrap related components
class Railsboot::Component < ViewComponent::Base
  COLORS = ["primary", "secondary", "success", "danger", "warning", "info", "light", "dark"].freeze
  DEFAULT_COLOR = "primary".freeze

  protected

  def fetch_or_raise(argument, constant)
    if argument.present? && constant.include?(argument.to_s)
      argument
    else
      raise ArgumentError, "The `#{argument}: #{argument}` argument is not valid, allowed options are #{constant.join(", ")}."
    end
  end

  def fetch_or_fallback(argument, constant, fallback)
    if argument.present? && constant.include?(argument.to_s)
      argument
    else
      fallback
    end
  end
end
