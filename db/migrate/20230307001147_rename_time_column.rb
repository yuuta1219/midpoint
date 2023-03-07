class RenameTimeColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :cards, :time, :integer
    add_column :cards, :time_start, :datetime
    add_column :cards, :time_end, :datetime
    add_column :cards, :title, :string
  end
end
