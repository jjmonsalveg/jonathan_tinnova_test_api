class User < ApplicationRecord
  has_secure_password

  has_many :beer_users
  has_many :beers, through: :beer_users

  validates_uniqueness_of :email, :username
  validates_presence_of :email, :username

  def to_token
    {
        id: self.id,
        name: self.name,
        username: self.username,
    }
  end
end
