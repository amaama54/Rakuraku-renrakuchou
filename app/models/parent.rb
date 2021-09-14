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
    
  has_many :parent_follows, dependent: :destroy
end
