class Menu < ActiveRecord::Base
  has_many :orders
  belongs_to :shop
end
