class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
