class Connection < ApplicationRecord
  
  belongs_to :teacher, optional: true
  
  has_many :keeps, dependent: :destroy
  has_many :parents, through: :keeps, source: :parent
  has_many :notifications, dependent: :destroy
  
  #parent.idがkeepsテーブル内に存在するか
  def keeped_by?(parent)
    keeps.where(parent_id: parent.id).exists?
  end
  
  #お知らせ通知作成
  def crate_notification_connection!(current_teacher)
    temp_ids = Teacher.all.select(:id).distinct
    temp_ids.each do |temp_id|
      save_notification_information!(current_teacher, temp_id["id"])
    end
  end
  
  def save_notification_connection!(current_parent, visited_id)
    notification = current_parent.active_notifications.new(
      visited_id: visited_id,
      connection_id: id,
      action: "connection"
      )
      notification.save if notification.valid?
  end
  
end
