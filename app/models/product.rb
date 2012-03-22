class Product < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  has_many :products_showrooms, dependent: :destroy
  has_many :showrooms, through: :products_showrooms
  
  validates :name, :presence => true
  validates :price, :presence => true, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0, :less_than => 99999}
  
  scope :ordered, order('products.created_at DESC')
  
  attr_accessible :name, :description, :image, :image_cache, :price
  
end
