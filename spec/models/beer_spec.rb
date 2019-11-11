require 'rails_helper'

RSpec.describe Beer, type: :model do
  subject { build(:beer)}

  it { is_expected.to validate_presence_of :abv }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to have_many(:beer_users) }
  it { is_expected.to have_many(:users) }

  describe  '.like_name' do
    let(:canadian_beer) { create(:beer, name: 'Canadian') }
    let(:extranger_beer) { create(:beer, name: 'extranger') }
    let(:target_beer) { create(:beer, name: 'Polar') }
    let(:target_beer_2) { create(:beer, name: 'Polarcita') }
    let(:target_beers) { [target_beer, target_beer_2] }

    it 'find values' do
      expect(Beer.like_name('Po')).to match(target_beers)
    end

    it 'empty collection' do
      expect(Beer.like_name('corona')).to be_blank
    end
  end
end
