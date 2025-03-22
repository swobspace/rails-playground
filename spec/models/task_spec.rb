require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to belong_to(:list) }
  it { should validate_presence_of(:subject) }


  it 'plain factory should working' do
    f = FactoryBot.create(:task)
    g = FactoryBot.create(:task)
    expect(f).to be_valid
    expect(g).to be_valid
  end

end
