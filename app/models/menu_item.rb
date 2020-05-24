class MenuItem < ApplicationRecord
  after_save :attach_default_photo

  has_many :toppings, :dependent => :destroy
  has_one_attached :photo
  accepts_nested_attributes_for :toppings, allow_destroy: true

  def attach_default_photo
    self.photo.attach(io: File.open('app/assets/images/default_pizza_photo.png'), filename: 'default.png') unless self.photo.attached?
  end
end
