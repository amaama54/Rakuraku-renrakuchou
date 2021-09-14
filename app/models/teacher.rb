class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :connections, dependent: :destroy
  has_many :years, dependent: :destroy
  has_many :follow_requests, dependent: :destroy
  has_many :parent_follows, dependent: :destroy
end
