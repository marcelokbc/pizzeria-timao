class MenuItem < ApplicationRecord
  belongs_to :menu
  has_many :order_items
end
