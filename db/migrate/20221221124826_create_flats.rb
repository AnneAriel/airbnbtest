class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.text :adress
      t.text :picture_url
      t.text :description
      t.integer :price_per_night
      t.integer :number_of_guest
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
