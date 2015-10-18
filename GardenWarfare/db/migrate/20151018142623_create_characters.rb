class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :type
      t.integer :money
      t.integer :blueMoney
      t.integer :strength
      t.integer :vitality
      t.integer :dexterity
      t.integer :level
      t.float :experience
      t.integer :inventoryCapacity
      t.references :user, index: true
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :characters, :users
  end
end
