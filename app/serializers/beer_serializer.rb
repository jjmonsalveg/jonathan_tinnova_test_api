class BeerSerializer < ActiveModel::Serializer
  attributes  :id, :name, :tagline, :description, :abv
  attribute :seen_at

  def seen_at
    object.beer_users.find{|been_user| been_user.user_id == instance_options[:current_user].id }&.seen_at || ''
  end
end
