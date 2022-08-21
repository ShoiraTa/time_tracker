namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    #if Time.now.sunday?
      employees = Employee.all
      message = "Please log in to overtime management dashbord to request overtime or confirm your hours for last weel https://timelog-overtime.herokuapp.com/"

      employees.each do |employee|
        Auditlog.create!(user: employee)
        SmsTool.send_sms(number: employee.phone_number, message: message)
    #end
    end
  end

  desc "Sends mail notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
        p 'done'
      end
    end
  end


end