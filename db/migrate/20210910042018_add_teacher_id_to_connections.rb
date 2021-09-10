class AddTeacherIdToConnections < ActiveRecord::Migration[5.2]
  def change
    add_column :connections, :teacher_id, :integer
  end
end
