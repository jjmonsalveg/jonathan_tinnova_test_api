class Beer < ApplicationRecord
  validates_presence_of :name, :abv
  validates_uniqueness_of :name

  scope :like_name, ->(str) {where('name like :value', value: "%#{str}%")}
end
