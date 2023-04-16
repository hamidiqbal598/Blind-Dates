require 'rails_helper'

RSpec.describe Team, type: :model do

  let(:leader) { FactoryBot.create(:employee) }
  let(:team) { FactoryBot.create(:team, leader: leader) }

  let(:employee_teams) { FactoryBot.create(:employee_teams, employee: leader, team: team) }
  let(:blind_date) { FactoryBot.create(:blind_date, team: team) }

  describe 'associations' do
    it { should belong_to(:leader) }
    it { should have_one(:blind_date) }
    it { should have_many(:employee_teams).dependent(:destroy) }
  end

end
