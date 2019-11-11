require 'rails_helper'

RSpec.describe BeersQuery do

  describe '.call' do

    context 'without params' do
      let(:beers) { create_list(:beer, 10)}
      it 'return all' do
        expect(described_class.call({})).to match beers
      end

    end

    context 'with  params' do
      context 'with name' do

      end

      context 'with abv' do

      end

      context 'both' do

      end
    end


  end
end
