class AddAccessibilityToPlots < ActiveRecord::Migration[7.0]
  def change
    add_column :plots, :accessibility, :integer, default: 0
    Plot.update_all(accessibility: 0)
  end
end
