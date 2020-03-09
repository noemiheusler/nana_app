class AddFirstnameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :text
  end
end
