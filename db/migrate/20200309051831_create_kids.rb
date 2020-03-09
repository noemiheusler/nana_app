class CreateKids < ActiveRecord::Migration[5.2]
  def change
    create_table :kids do |t|
      t.date :birthday
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
