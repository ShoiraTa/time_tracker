module PostsHelper
  def status_label status
    status_span_generator status
  end

  private

  def status_span_generator status
    case status
    when 'submitted'
      content_tag(:span, status.capitalize, class: 'badge bg-primary')
    when 'approved'
      content_tag(:span, status.capitalize, class: 'badge bg-success')
    when 'rejected'
      content_tag(:span, status.capitalize, class: 'badge bg-danger')
    end
  end
end
