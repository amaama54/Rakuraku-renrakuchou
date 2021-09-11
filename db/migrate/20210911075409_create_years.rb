class CreateYears < ActiveRecord::Migration[5.2]
  def change
    create_table :years do |t|
      t.string :title
      t.datetime :start_time

      t.timestamps
    end
  end
end
