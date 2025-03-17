require 'rails_helper'

RSpec.describe Person, type: :model do
  it { is_expected.to belong_to(:category).optional }

  it 'should get plain factory working' do
    f = FactoryBot.create(:person)
    g = FactoryBot.create(:person)
    expect(f).to be_valid
    expect(g).to be_valid
  end

end
