class CreateItineraries < ActiveRecord::Migration[7.2]
  def change
    create_table :itineraries do |t|
      t.string :name
      t.text :description
      t.date :star_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
