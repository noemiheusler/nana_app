class AddLastnameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lastname, :text
  end
end
