class AuditlogsController < ApplicationController
  def index
    @auditlogs = Auditlog.all
  end
end
