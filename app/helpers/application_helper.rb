module ApplicationHelper
  include Pagy::Frontend

  def active?(path)
    'active' if current_page?(path)
  end

  def status_label status
    status_span_generator status
  end

  def admin_types 
    ['AdminUser']
  end
  private
  def status_span_generator status
    case status
    when 'submitted'
      content_tag(:span, status.capitalize, class: 'badge bg-primary')
    when 'pending'
      content_tag(:span, status.capitalize, class: 'badge bg-primary')
    when 'approved'
      content_tag(:span, status.capitalize, class: 'badge bg-success')
    when 'confirmed'
      content_tag(:span, status.capitalize, class: 'badge bg-success')
    when 'rejected'
      content_tag(:span, status.capitalize, class: 'badge bg-danger')
    end
  end
end
