class MenuItem < ApplicationRecord
  has_many :toppings, :dependent => :destroy
  has_one_attached :photo
  accepts_nested_attributes_for :toppings, allow_destroy: true
end
