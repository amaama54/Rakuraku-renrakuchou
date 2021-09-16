class Connection < ApplicationRecord
  
  belongs_to :teacher, optional: true
  
  has_many :keeps, dependent: :destroy
  has_many :parents, through: :keeps, source: :parent
  
  #parent.idがkeepsテーブル内に存在するか
  def keeped_by?(parent)
    keeps.where(parent_id: parent.id).exists?
  end
end
