class BlindDate < ApplicationRecord

  belongs_to :team, class_name: 'Team', dependent: :destroy

  scope :specific_date, -> (date) { where('date >= ?', date.to_time.midnight).where('date < ?', date.to_time.midnight + 1.day) }
  scope :last_1_months, -> { where('date >= ?', Time.now.beginning_of_day - 1.month) }
end
