class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  # must have a username, no more than 30 chars
  validates :username, presence: true, length: { maximum: 30 }
  # regex for usernames: no special symbols
  VALID_USERNAME_REGEX = /\A\w[\w.-]*(\s\w[\w.-])*\z/
  validates :username, format: { with: VALID_USERNAME_REGEX }
end
