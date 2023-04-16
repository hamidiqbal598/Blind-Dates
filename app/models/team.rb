class Team < ApplicationRecord

  belongs_to :leader, class_name: 'Employee'
  has_many :employee_teams, dependent: :destroy
  has_many :employees, through: :employee_teams
  has_one :blind_date, class_name: 'BlindDate', dependent: :destroy

  scope :latest_on_top, -> { order(id: :desc) }
  scope :last_2_months, -> { where('created_at >= ?', Time.now.beginning_of_day - 2.month) }

end
