class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.integer :max_participants
      t.date :start_date
      t.date :end_date
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
