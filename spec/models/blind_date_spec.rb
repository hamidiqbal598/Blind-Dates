require 'rails_helper'

RSpec.describe BlindDate, type: :model do

  let(:team) { FactoryBot.create(:team, leader: leader) }


  describe 'associations' do
    it { should belong_to(:team) }
  end

end
