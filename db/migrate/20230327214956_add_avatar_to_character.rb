class AddAvatarToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :age, :integer
    add_column :characters, :appearance, :string
    add_column :characters, :occupation, :string
    add_column :characters, :personality, :text
    add_column :characters, :motivation, :text
    add_column :characters, :relationship, :text
    add_column :characters, :role, :string
    add_column :characters, :avatar, :string
  end
end
