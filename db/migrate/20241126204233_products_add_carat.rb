class ProductsAddCarat < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :carat, :integer
    add_column :products, :secret, :boolean
  end
end
