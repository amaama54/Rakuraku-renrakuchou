class CreateFollowRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_requests do |t|
      t.integer :teacher_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
