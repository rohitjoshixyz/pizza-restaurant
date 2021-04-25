class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :admin

  scope :descending, -> { order("created_at DESC") }
end
