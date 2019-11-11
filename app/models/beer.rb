class Beer < ApplicationRecord

  has_many :beer_users
  has_many :users, through: :beer_users

  validates_presence_of :name, :abv
  validates_uniqueness_of :name

  scope :like_name, ->(str) {where('name ILIKE :value', value: "%#{str}%")}
end
