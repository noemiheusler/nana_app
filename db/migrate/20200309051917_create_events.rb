class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.integer :max_participants
      t.datetime :start_date
      t.datetime :end_date
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
