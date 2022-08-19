class PagesController < ApplicationController
  def index
    @pending_approvals = Post.submitted
    @recent_audit_items = Auditlog.last(9)
  end
end
