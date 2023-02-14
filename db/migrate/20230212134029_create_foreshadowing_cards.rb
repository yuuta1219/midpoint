class CreateForeshadowingCards < ActiveRecord::Migration[7.0]
  def change
    create_table :foreshadowing_cards do |t|
      t.references :foreshadowing, foreign_key: true
      t.references :card, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
