class CreateForeshadowingCards < ActiveRecord::Migration[7.0]
  def change
    create_table :foreshadowing_cards do |t|
      t.references :foreshadowing, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
