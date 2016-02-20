class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :level, default: 1
      t.integer :total_exp, default: 0
      t.timestamps null: false
    end
  end
end
