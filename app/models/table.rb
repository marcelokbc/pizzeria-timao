class Table < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :user, optional: true
  
  enum :status, { free: 0, occupied: 1, reserved: 2 }

  scope :free, -> { where(status: "free") }
  scope :occupied, -> { where(status: "occupied") }
  scope :reserved, -> { where(status: "reserved") }

end
