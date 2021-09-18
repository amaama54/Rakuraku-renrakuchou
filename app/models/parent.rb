class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #フォローリクエストを送っているかどうかを判定
  has_many :follow_requests, dependent: :destroy
    def already_requested?(teacher)
      self.follow_requests.exists?(teacher_id: teacher.id)
    end

    def already_followed?(teacher)
      self.parent_follows.exists?(teacher_id: teacher.id)
    end

  #has_many :parent_follows, dependent: :destroy
  has_many :parent_follows
  has_many :teachers, through: :parent_follows, source: :teacher
  
  has_many :keeps, dependent: :destroy
  has_many :connections, through: :keeps, source: :connection
  #通知を受け取る
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
end
