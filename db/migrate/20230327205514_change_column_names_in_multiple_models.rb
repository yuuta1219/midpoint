class ChangeColumnNamesInMultipleModels < ActiveRecord::Migration[7.0]
  def change
    rename_column :plots, :length, :length_type
    rename_column :plots, :time, :timeline
    rename_column :notifications, :message, :body
  end
end
