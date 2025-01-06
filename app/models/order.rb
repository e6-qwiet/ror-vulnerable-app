class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy

  validates :bank_account_number, :routing_number, :address_street,
            :address_city, :address_state, :address_zip, presence: true
end
