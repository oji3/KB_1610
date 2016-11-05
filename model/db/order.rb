class Order < ActiveRecord::Base
    belongs_to :order_group
    belongs_to :menu
end
