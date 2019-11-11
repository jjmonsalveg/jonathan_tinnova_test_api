class BeerSerializer < ActiveModel::Serializer
  attributes  :id, :name, :tagline, :description, :abv
end
