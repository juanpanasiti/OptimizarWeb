class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  include PermissionConcern

  # Validates
	validates :name, presence: true
	validates :surname, presence: true
	validates :email, presence: true, uniqueness: true
end
