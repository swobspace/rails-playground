require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:content) }


  it 'plain factory should working' do
    f = FactoryBot.create(:post)
    g = FactoryBot.create(:post)
    expect(f).to be_valid
    expect(g).to be_valid
  end

end
