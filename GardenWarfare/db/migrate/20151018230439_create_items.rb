class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.float :defense
      t.float :attack
      t.float :evasion
      t.float :crit
      t.float :hit_chance
      t.float :life

      t.timestamps null: false
    end
  end
end
