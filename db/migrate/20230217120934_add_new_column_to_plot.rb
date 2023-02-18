class AddNewColumnToPlot < ActiveRecord::Migration[7.0]
  def change
    add_column :plots, :color, :integer, null: false, default: 0
  end
end
