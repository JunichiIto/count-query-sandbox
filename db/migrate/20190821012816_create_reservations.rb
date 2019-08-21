class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.string :guest_name
      t.datetime :reserved_at

      t.timestamps
    end
  end
end
