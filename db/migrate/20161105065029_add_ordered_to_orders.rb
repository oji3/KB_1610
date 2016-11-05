class AddOrderedToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :ordered, :boolean
  end
end
