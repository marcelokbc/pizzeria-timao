class Order < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_many :order_items, dependent: :destroy

  before_salve :calculate_total_price

  private

  def calculate_total_price
    self.total_price = order_items.sum { |item| item.quantity * item.menu_item.price }
  end
end
