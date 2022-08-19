class AuditlogsController < ApplicationController
  def index
    @pagy, @auditlogs = pagy(Auditlog.all)
   authorize  @auditlogs
  end
	def confirm
		auditlog = Auditlog.find(params[:id])
		authorize auditlog
		auditlog.confirmed!
		redirect_to root_path, notice: "Thank you, your confirmation has been successfully made."
	end
end
