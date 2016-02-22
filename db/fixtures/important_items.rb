require 'csv'

CSV.foreach 'db/fixtures/csv/important_items.csv' do |row|
  ImportantItem.seed :name do |s|
    s.id = row[0]
    s.name = row[1]
    s.description = row[2]
    s.experience = row[3]
    s.created_at = row[5]
    s.updated_at = row[6]
  end
end
