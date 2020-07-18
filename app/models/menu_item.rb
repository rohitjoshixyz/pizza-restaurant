class MenuItem < ApplicationRecord
  before_destroy :not_referenced_by_any_cart_item
  after_save :attach_default_photo
  # mount_uploader :photo, PhotoUploader

  has_many :toppings, dependent: :destroy
  has_many :cart_items
  has_one_attached :photo
  accepts_nested_attributes_for :toppings, allow_destroy: true

  def attach_default_photo
    unless photo.attached?
      photo.attach(io: File.open('app/assets/images/default_pizza_photo.png'), filename: 'default.png')
      photo = url_for(photo)
    end
  end

  def not_referenced_by_any_cart_item
    unless cart_items.empty?
      errors.add(:base, 'Cart items present')
      throw :abort
    end
  end
end
