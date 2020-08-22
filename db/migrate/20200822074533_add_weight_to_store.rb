class AddWeightToStore < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :weights, :integer, :default => 1
  end
end
