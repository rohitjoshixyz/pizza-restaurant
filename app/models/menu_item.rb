class MenuItem < ApplicationRecord
  after_save :attach_default_photo
  # mount_uploader :photo, PhotoUploader

  has_many :toppings, dependent: :destroy
  belongs_to :cart_item
  has_one_attached :photo
  accepts_nested_attributes_for :toppings, allow_destroy: true

  def attach_default_photo
    unless photo.attached?
      photo.attach(io: File.open('app/assets/images/default_pizza_photo.png'), filename: 'default.png')
    end
  end
end
