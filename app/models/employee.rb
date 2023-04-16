class Employee < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :employee_teams, dependent: :destroy
  has_many :teams, through: :employee_teams
  has_many :team_leader, class_name: 'Team', foreign_key: 'leader_id'

  scope :not_admin, -> { where(role: "user") }
  scope :up_for_lunch, -> { where(wants_to_go_lunch: true) }

  validates :name, :email, :department, presence: true

end
