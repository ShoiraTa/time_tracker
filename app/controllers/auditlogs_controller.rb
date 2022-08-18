class AuditlogsController < ApplicationController
  def index
    @auditlogs = Auditlog.all
    authorize  @auditlogs
  end
end
