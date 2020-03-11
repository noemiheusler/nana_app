class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
    t.integer :user_id #user that has favorite
    t.integer :nana_id #the actual favorite of the user
    t.timestamps
    end
  end
end
