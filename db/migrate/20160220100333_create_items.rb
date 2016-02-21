class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :category, index: true, foreign_key: true

      t.string :name
      t.text :description
      t.integer :rarity
      t.integer :hierarchy
      t.integer :price, default: 0
      t.integer :exp, default: 0
      t.boolean :experience, default: 0
      t.boolean :activity, default: 1
      t.timestamps null: false
    end
    add_index :items, :name, unique: true
    add_index :items, [:rarity, :experience]
  end
end
