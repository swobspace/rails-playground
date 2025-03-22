require 'rails_helper'

RSpec.describe Person, type: :model do
  it { is_expected.to belong_to(:category).optional }
  it { should validate_presence_of(:sn) }
  it { should validate_presence_of(:givenname) }
  it { should validate_presence_of(:username) }


  it 'plain factory should working' do
    f = FactoryBot.create(:person)
    g = FactoryBot.create(:person)
    expect(f).to be_valid
    expect(g).to be_valid
    expect(f).to validate_uniqueness_of(:username)
  end

end
