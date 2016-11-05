class RemoveUserIdToOrderGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_groups, :user_id
  end
end
