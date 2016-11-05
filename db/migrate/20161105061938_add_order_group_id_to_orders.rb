class AddOrderGroupIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :order_group_id, :integer
  end
end
