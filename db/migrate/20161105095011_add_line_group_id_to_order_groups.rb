class AddLineGroupIdToOrderGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :order_groups, :line_group_id, :string
  end
end
