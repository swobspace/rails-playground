require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { FactoryBot.create(:list, name: "My List Name") }
  it { is_expected.to have_many(:tasks).dependent(:restrict_with_error) }
  it { is_expected.to validate_presence_of(:name) }

  it 'plain factory should working' do
    f = FactoryBot.create(:list)
    g = FactoryBot.create(:list)
    expect(f).to be_valid
    expect(g).to be_valid
  end

  it { expect(list.to_s).to eq("My List Name") }

end
