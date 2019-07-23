class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :professional, foreign_key: true
      t.date :date
      t.references :user, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
