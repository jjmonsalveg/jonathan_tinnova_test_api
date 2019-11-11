class AddFavoriteToBeerUser < ActiveRecord::Migration[5.2]
  def change
    add_column :beer_users, :favorite, :boolean, default: false
  end
end
