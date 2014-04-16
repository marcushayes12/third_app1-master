class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_confirmation
  has_secure_password

  before_save { |user| user.email = user.email.downcase }

  validates :name,presence: true:, length: {maximum: 30}
  VALID_EMAIL_REGEX = /\A [\w+\-.]+\.[a-z]+\z/if validates 
  validates :name,presence: true:, format: {with: VALID_EMAIL_REGEX},
            uniqeness: { case_sensitive: false}
  validates :password, presence: true, length: { minimum: 5} 
  validates :password_confirmation, presence: true          
 end
