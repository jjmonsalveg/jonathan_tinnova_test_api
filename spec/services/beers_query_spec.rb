require 'rails_helper'

RSpec.describe BeersQuery do

  describe '.call' do

    context 'without params' do
      let(:beers) { create_list(:beer, 10)}

      it 'return all' do
        expect(described_class.call({})).to match(beers)
      end
    end

    context 'with  params' do
      let(:canadian_beer) { create(:beer, name: 'Canadian') }
      let(:extranger_beer) { create(:beer, name: 'extranger') }
      let(:target_beer) { create(:beer, name: 'Polar') }
      let(:target_beer_2) { create(:beer, name: 'Polarcita') }
      let(:target_beers) { [target_beer, target_beer_2] }

      it 'with name' do
        expect(described_class.call(name: 'pol')).to contain_exactly(*target_beers)
      end

      it 'with abv' do

      end

      it 'both' do

      end
    end


  end
end
