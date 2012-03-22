class Product < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  has_many :products_showrooms, dependent: :destroy
  has_many :showrooms, through: :products_showrooms
  
end
