class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :category, index: true, foreign_key: true, null: false

      t.string :name
      t.text :description
      t.integer :rarity
      t.integer :hierarchy
      t.integer :price
      t.integer :exp
      t.boolean :experience
      t.boolean :activity
      t.timestamps null: false
    end
    add_index :items, :name, unique: true
    add_index :items, [:rarity, :experience]
  end
end
