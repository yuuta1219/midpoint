class CreateCharacterKnows < ActiveRecord::Migration[7.0]
  def change
    create_table :character_knows do |t|
      t.references :character, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
