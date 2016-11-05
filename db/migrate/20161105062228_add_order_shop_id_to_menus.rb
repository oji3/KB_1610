class AddOrderShopIdToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :shop_id, :integer
  end
end
