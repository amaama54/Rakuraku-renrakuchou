class AddTeacherIdToYears < ActiveRecord::Migration[5.2]
  def change
    add_column :years, :teacher_id, :integer
  end
end
