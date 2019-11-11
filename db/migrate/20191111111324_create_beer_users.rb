class CreateBeerUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :beer_users do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :beer, index: true, foreign_key: true, null: false
      t.date :date, null: false
      t.time :time, null: false

      t.timestamps
    end

    add_index :beer_users, %i[user_id beer_id], unique: true
  end
end
