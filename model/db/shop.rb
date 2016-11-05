class Shop < ActiveRecord::Base
  has_many :order_groups
  has_many :menus
end
