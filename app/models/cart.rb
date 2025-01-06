class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items, dependent: :destroy

  def self.create_for_user(user)
    user.cart || Cart.create(user_id: user.id)
  end
end
