class Beer < ApplicationRecord
  validates_uniqueness_of :name
end
