require 'rails_helper'

RSpec.describe EmployeeTeam, type: :model do

  let(:employee) { FactoryBot.create(:employee) }
  let(:team) { FactoryBot.create(:team, leader: leader) }


  describe 'associations' do
    it { should belong_to(:employee) }
    it { should belong_to(:team) }
  end

end
