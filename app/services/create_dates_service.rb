class CreateDatesService
  attr_reader :date

  def initialize(date)
    @date = date
  end


  def call

    already_leaders = []
    last_teams = []
    employees = Employee.not_admin.up_for_lunch
    teams = Team.includes(:employee_teams, :employees, :leader, :blind_date)
    if teams.present?
      last_teams = teams.where('teams.created_at >= ?', Time.now.beginning_of_day - 2.month)
      already_leaders = last_teams.pluck(:leader_id).uniq
    end

    (department_counts, hash) = employees.group(:department).count
    sorted_departments = department_counts.sort_by { |_, count| -count }.map { |department, _| department }

    normal_group_strength = 5
    remaining_count = employees.count % normal_group_strength
    (0...employees.count / normal_group_strength).each do
      begin
        leader_employee = employees.sample
      end while (already_leaders.include?(leader_employee.id))
      team = Team.create(name: Faker::Name.name, leader_id: leader_employee.id)
      EmployeeTeam.create(employee: leader_employee, team: team)
      @blind_date = BlindDate.create(date: @date, team: team)

      employees = employees.reject { |e| e.id == leader_employee.id }

      begin
        other_employees = employees.sample( remaining_count > 0 ? normal_group_strength : normal_group_strength - 1)
      end while( already_team_exists(last_teams, leader_employee, other_employees) )

      other_employees.each do |employee|
        EmployeeTeam.create(employee: employee, team: team)
        mail = NotificationMailer.new_notification(@blind_date, employee, leader_employee)
        # mail.deliver_now()
        employees = employees.reject { |e| e.id == employee.id }
      end
      remaining_count -= 1

    end
  end

  def already_team_exists(last_teams, leader_employee, other_employees)
    flag = false
    other_employees_ids = other_employees.pluck(:id)
    other_employees_ids << leader_employee.id
    last_teams.each do |team|
      if team.employees.pluck(:id).sort! == other_employees_ids.sort!
        flag = true
      end
    end
    flag
  end

end