class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email, :username

  def to_token
    {
        id: self.id,
        name: self.name,
        username: self.username,
    }
  end
end
