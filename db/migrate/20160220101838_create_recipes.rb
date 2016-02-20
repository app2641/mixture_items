class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :item, index: true, foreign_key: true, null: false

      t.integer :materials1_id
      t.integer :materials2_id
      t.integer :items_id
      t.timestamps null: false
    end
    add_index :recipes, [:materials1_id, :materials2_id]
    add_foreign_key :recipes, :materials, column: :materials1_id
    add_foreign_key :recipes, :materials, column: :materials2_id
  end
end
