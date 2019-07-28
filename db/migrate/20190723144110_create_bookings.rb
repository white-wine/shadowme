class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :professional, foreign_key: true
      t.date :start_book
      t.date :end_book
      t.integer :amount_of_days
      t.references :user, foreign_key: true
      t.integer :booking_status
      t.text :intro_message

      t.timestamps
    end
  end
end
