class OrderProduct < ApplicationRecord
  belongs_to :order

  validates :title, :price, presence: true
end
