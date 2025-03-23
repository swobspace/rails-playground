require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to have_many(:people) }
  it { should validate_presence_of(:name) }


  it 'plain factory should working' do
    f = FactoryBot.create(:category)
    g = FactoryBot.create(:category)
    expect(f).to be_valid
    expect(g).to be_valid
    expect(f).to validate_uniqueness_of(:name).case_insensitive
  end

end
