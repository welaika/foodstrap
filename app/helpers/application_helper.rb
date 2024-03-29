# encoding: utf-8
module ApplicationHelper
  def flash_class(level)
    case level
    when :alert then "warning"
    when :error then "error"
    when :notice then "info"
    when :success then "success"
    end
  end

  def currency_hash
    {
      "USD" => "$",
      "EUR" => "€"
    }
  end

  def form_error_messages(resource)
    if resource.errors.present?
      content_tag :ul, {:class => "form_errors"} do
        resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join.html_safe
      end
    else
      ""
    end
  end

  def site_name
    "FoodStrap.me"
  end
end
