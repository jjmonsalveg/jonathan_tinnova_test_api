require 'rails_helper'

RSpec.describe 'Routes for Beers', type: :routing do
  it 'index'do
    expect(:get => "/beers").to route_to(controller: 'beers' , action: 'index')
  end

  it 'show'do
    expect(:get => "/beers/1").to route_to(controller: 'beers' , action: 'show', id: '1')
  end

  it 'favorite'do
    expect(:post => "/beers/1/favorite").to route_to(controller: 'beers' , action: 'favorite', id: '1')
  end

  it 'favorite'do
    expect(:get => "/beers/favorites").to route_to(controller: 'beers' , action: 'favorites')
  end

  it 'should not have [create show destroy] routes' do
    expect(post: '/beers').to_not be_routable
    expect(delete: '/beers/1').to_not be_routable
  end
end
