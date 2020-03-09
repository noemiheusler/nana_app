class AddMottoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :motto, :text
  end
end
