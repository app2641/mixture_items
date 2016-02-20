class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.references :profile, index: true, foreign_key: true, null: false

      t.string :salt, limit: 128
      t.string :api_key, limit: 40
      t.timestamps null: false
    end
  end
end
