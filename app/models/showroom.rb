class Showroom < ActiveRecord::Base
  
  belongs_to :user
  has_many :products_showrooms, dependent: :destroy
  has_many :products, through: :products_showrooms
  
  validates :user_id, :presence => true
  
  scope :outdated, where("current = :current AND created_at < :date", {current: true, date: 1.month.ago.beginning_of_day})
  
end
