class CreateTranscations < ActiveRecord::Migration[6.0]
  def change
    create_table :transcations do |t|
      t.integer :store_id
      t.integer :book_id
      t.integer :user_id
      t.float :amount
      t.datetime :trans_time

      t.timestamps
    end
  end
end
