module ApplicationHelper

  def logout_path
    destroy_employee_session_path
  end

end
