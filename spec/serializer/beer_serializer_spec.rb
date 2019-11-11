require 'rails_helper'

describe BeerSerializer, type: :serializer do
  let(:beer) { create(:beer) }
  let(:serializer) { described_class.new(beer) }

  subject { serialized_json(serializer) }

  it 'should have right keys' do
    expect(subject.keys).to match_array(%w[
                                          id
                                          name
                                          tagline
                                          description
                                          abv
                                        ])
  end
end
