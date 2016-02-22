class Category < ActiveRecord::Base
  has_many :item
  has_many :material
end
