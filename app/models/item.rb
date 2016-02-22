class Item < ActiveRecord::Base
  belongs_to :category

  enum rarity: {
    S: 0,
    A: 1,
    B: 2,
    C: 3,
    D: 4
  }
end
