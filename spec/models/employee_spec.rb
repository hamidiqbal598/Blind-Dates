require 'rails_helper'

RSpec.describe Employee, type: :model do

  describe "#Requires?" do

    let(:employee) { create(:employee) }

    it "requires a name" do
      expect(employee).to validate_presence_of(:name)
    end

    it "requires a email" do
      expect(employee).to validate_presence_of(:email)
    end

    it "requires a department" do
      expect(employee).to validate_presence_of(:department)
    end
  end

  describe 'password encryption' do
    it 'encrypts the password' do
      employee = Employee.create(email: 'hamidtest1@gmail.com', password: 'password')
      expect(employee.encrypted_password).not_to be_nil
      expect(employee.encrypted_password).not_to eq('password')
    end
  end

  describe 'authentication' do
    let(:employee) { Employee.create(email: 'hamidtest1@gmail.com', password: 'password') }

    it 'authenticates with correct password' do
      expect(employee.valid_password?('password')).to be_truthy
    end

    it 'does not authenticate with incorrect password' do
      expect(employee.valid_password?('wrongpassword')).to be_falsey
    end
  end

end
