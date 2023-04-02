class PopulateSlugsForExistingPlots < ActiveRecord::Migration[7.0]
  def up
    Plot.find_each do |plot|
      plot.update_column(:slug, SecureRandom.hex(10))
    end
  end

  def down
    Plot.update_all(slug: nil)
  end
end
