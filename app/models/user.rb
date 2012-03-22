class User < ActiveRecord::Base
  ROLES = %w[admin user]
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :showrooms, :dependent => :destroy do
    def current
      order("showrooms.created_at DESC").first
    end
  end
  
  before_save :check_and_set_role
  after_create :create_first_showroom
  
  
  def admin?
    "admin" == self.role
  end
  
  def create_first_showroom
    
  end
  
  private
  
  def check_and_set_role
    self.role = "user" if self.role.blank?
  end
end
