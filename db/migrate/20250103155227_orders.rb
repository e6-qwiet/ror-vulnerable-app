class Orders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.string :bank_account_number
      t.string :routing_number
      t.string :address_street
      t.string :address_second_line
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :status

      t.timestamps
    end

    create_table :order_products do |t|
      t.references :order, null: false, foreign_key: true

      # Fields copied from products
      t.string :title, null: false
      t.text :description
      t.integer :price, null: false
      t.string :image_url
      t.integer :carat
      t.boolean :secret
      t.text :status

      t.timestamps
    end

  end
end
