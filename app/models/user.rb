
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :loginname, :name, :login, :role_ids
  # attr_accessible :title, :body
  
  attr_accessor :login
  
  
  def admin?
    self.role?('admin')
  end
  
  def role?(r)
    self.roles.collect(&:name).include?(r)
  end
  
  def operation?(o)
    self.roles.each do |role|
      if role.operation?(o)
        return true
      end
    end
    return false
  end
  
  def operations
    o = Array.new
    self.roles.each do |role|
      role.operations.each do |operation|
        o << operation
      end
    end
    return o.uniq
  end
  
  # override devise
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(loginname) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end  
end
