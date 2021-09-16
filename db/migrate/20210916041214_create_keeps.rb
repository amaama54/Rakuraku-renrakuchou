class CreateKeeps < ActiveRecord::Migration[5.2]
  def change
    create_table :keeps do |t|
      t.integer :parent_id
      t.integer :connection_id

      t.timestamps
    end
  end
end
