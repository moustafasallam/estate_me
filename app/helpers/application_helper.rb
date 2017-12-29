module ApplicationHelper

  def flash_message(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{message_class_for(msg_type)}") do
        concat message
      end)
    end
    nil
  end

  def message_class_for(flash_type)
    case flash_type.to_sym
      when :success
        'alert-success'
      when :error
        'alert-danger'
      when :alert
        'alert-warning'
      when :notice
        'alert-info'
      else
        flash_type.to_s
    end
  end

end
