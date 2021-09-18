class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :connections, dependent: :destroy
  has_many :years, dependent: :destroy
  has_many :follow_requests, dependent: :destroy
  #has_many :parent_follows, dependent: :destroy
  has_many :parent_follows
  has_many :parents, through: :parent_follows, source: :parent
  #通知を知らせる
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
end
