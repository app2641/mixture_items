require 'csv'

CSV.foreach 'db/fixtures/csv/items.csv' do |row|
  Item.seed :name do |s|
    s.id = row[0]
    s.name = row[1]
    s.description = row[2]
    s.rarity = Item.rarities[row[3]]
    s.price = row[4]
    s.exp = row[5]
    s.hierarchy = row[7]
    s.created_at = row[9]
    s.updated_at = row[10]
  end
end
