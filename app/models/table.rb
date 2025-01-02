class Table < ApplicationRecord
  has_many :orders
  belongs_to :user, optional: true

  scope :free, -> { where(status: "free") }
  scope :occupied, -> { where(status: "occupied") }
  scope :reserved, -> { where(status: "reserved") }

  enum status: { free: 0, occupied: 1, reserved: 2 }
end
