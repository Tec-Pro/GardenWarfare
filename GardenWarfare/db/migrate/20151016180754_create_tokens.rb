class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :expires_at
      t.string :datetime
      t.references :user, index: true
      t.string :token

      t.timestamps null: false
    end
    add_foreign_key :tokens, :users
  end
end
