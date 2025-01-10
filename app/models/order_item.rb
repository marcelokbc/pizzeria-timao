class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  validates: :quantity, numericality: { greater_than_or_equal_to: 1 }
end
