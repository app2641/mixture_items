class CreateImportantItems < ActiveRecord::Migration
  def change
    create_table :important_items do |t|
      t.string :name
      t.text :description
      t.boolean :experience
      t.boolean :activity
      t.timestamps null: false
    end
    add_index :important_items, :name, unique: true
    add_index :important_items, :experience
  end
end
