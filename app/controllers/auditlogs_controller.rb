class AuditlogsController < ApplicationController
  def index
    @pagy, @auditlogs = pagy(Auditlog.all)
   authorize  @auditlogs
  end
end
