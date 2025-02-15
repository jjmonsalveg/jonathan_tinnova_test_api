class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.string :tagline
      t.string :description
      t.float :abv, null: false

      t.timestamps
    end
    add_index :beers, :name, unique: true
    add_index :beers, :abv
    add_index :beers, [:abv, :name]
  end
end
