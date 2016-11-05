class AddShopIdToOrderGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :order_groups, :shop_id, :integer
  end
end
