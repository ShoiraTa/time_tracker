class PagesController < ApplicationController
  def index
    if admin_types.include?(current_user.type)
      @pending_approvals = Post.submitted
      @recent_audit_items = Auditlog.last(9)
    else
      @pending_audit_confirmations = current_user.auditlogs.pending.order('start_date desc')
    end
  end
end
