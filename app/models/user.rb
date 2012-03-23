class User < ActiveRecord::Base
  ROLES = %w[admin user]
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :showrooms, :dependent => :destroy do
    def find_current
      where(current: true).first
    end
  end

  before_save :check_and_set_role
  after_create :populate_showroom


  def admin?
    "admin" == self.role
  end

  def populate_showroom
    self.showrooms.find_current.update_attribute(:current,  false) if self.showrooms.count > 0 && self.showrooms.find_current
    s = Showroom.new
    s.user_id = self.id
    s.save!
    pcount = Product.count
    10.times do
      rand_product = Product.ordered[rand(pcount)]
      ProductsShowroom.create!(product_id: rand_product.id, showroom_id: s.id)
    end if pcount > 0
  end

  private

  def check_and_set_role
    self.role = "user" if self.role.blank?
  end
end
