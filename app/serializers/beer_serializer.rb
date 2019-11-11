class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :tagline, :description, :abv
  attribute :seen_at
  attribute :favorite

  def seen_at
    beer_user&.seen_at || ''
  end

  def favorite
    !!beer_user&.favorite
  end

  private

  def beer_user
    object.beer_users.find { |been_user| been_user.user_id == instance_options[:current_user].id }
  end
end
