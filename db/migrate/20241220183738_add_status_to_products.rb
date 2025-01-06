class AddStatusToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :status, :text
  end
end
