class EmployeeTeam < ApplicationRecord

  belongs_to :employee, dependent: :destroy
  belongs_to :team, dependent: :destroy

end
