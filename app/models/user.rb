class User < ActiveRecord::Base

  # Access control
  attr_accessor   :password
  attr_accessible :name, :email, :password, :password_confirmation

  # Relational
  has_one :cart

  # Validations
  validates(:name, 
            :length => { :within => 1..50 })

  email_regex = /\A[\w\-.]+@([\w\-]+\.)+\w+\z/i
  validates(:email,
            :presence => true,
            :format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }
            )

  validates(:password,
            :presence => true,
            :confirmation => true,
            :length => { :within => 6..40}
            )

  validates(:cart,
            :presence => true)
  
  # DB access
  before_save :encrypt_password

  def initialize(attributes = nil)
    super(attributes)
    self.cart = Cart.new
    self.cart.build :user => self
  end

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email email
    return nil if user.nil?
    return user if user.has_password? submitted_password
  end

  private


  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt password
  end

  def encrypt(string)
    secure_hash "#{salt}--#{string}"
  end

  def make_salt
    secure_hash "#{Time.now.utc}--#{password}"
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest string
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email email
    return nil if user.nil?
    return user if user.has_password? submitted_password
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id id
    return nil if user.nil?
    return user if user.salt == cookie_salt
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

