class Showroom < ActiveRecord::Base
  
  belongs_to :user
  has_many :products_showrooms, dependent: :destroy
  has_many :products, through: :products_showrooms
  
  validates :user_id, :presence => true
  
end
