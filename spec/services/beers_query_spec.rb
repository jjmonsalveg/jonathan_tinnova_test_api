require 'rails_helper'

RSpec.describe BeersQuery do

  describe '.call' do

    context 'without params' do
      let(:beers) { create_list(:beer, 10) }

      it 'return all' do
        expect(described_class.call({})).to match(beers)
      end
    end

    context 'with  params' do
      let(:canadian_beer) { create(:beer, name: 'Canadian', abv: 2) }
      let(:extranger_beer) { create(:beer, name: 'extranger', abv: 3) }
      let(:target_beer) { create(:beer, name: 'Polar', abv: 4.5) }
      let(:target_beer_2) { create(:beer, name: 'Polarcita', abv: 4) }
      let(:target_beers) { [target_beer, target_beer_2] }

      it 'with name' do
        expect(described_class.call(name: 'pol')).to contain_exactly(*target_beers)
      end

      it 'with abv' do
        expect(described_class.call(abv: 4.5)).to include(have_attributes(id: target_beer.id))
      end

      it 'both' do
        expect(described_class.call(abv: 2, name: 'ca')).to include(have_attributes(id: canadian_beer.id))
      end
    end

    it 'no records in database' do
      aggregate_failures 'independent from params' do
        expect(described_class.call(abv: 2, name: 'ca')).to match_array Beer.none
        expect(described_class.call({})).to match_array Beer.none
      end
    end
  end
end
