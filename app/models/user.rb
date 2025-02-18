class User < ApplicationRecord
  attr_accessor :avatar_url

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :destroy

  has_one :cart, dependent: :destroy
  has_many :cart_items, through: :cart
  has_many :orders, dependent: :destroy

  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_cart


  def import_avatar_from_url
    return false if avatar_url.blank?

    begin
      t = Time.now.to_i
      system("mkdir ./tmp")
      system("mkdir ./tmp/images")
      system("wget -O ./tmp/images/#{t} #{avatar_url}")


      avatar.attach(
        io: File.open("./tmp/images/#{t}"), filename: "#{t}"
      )

      true
    rescue Exception => e
      puts e
      Rails.logger.error("Failed to import avatar: #{e.message}")
      false
    end
  end

  private

  def create_cart
    Cart.create_for_user(self)
  end
end
