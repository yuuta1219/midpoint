class AddColumnsToPlots < ActiveRecord::Migration[7.0]
  def change
    add_column :plots, :length, :integer, null: false, default: 0
    add_column :plots, :time, :datetime
    add_column :plots, :person, :integer, null: false, default: 0
  end
end
