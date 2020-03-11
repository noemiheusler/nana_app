class ChangeUserCoordinatesType < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :longitude, :float
    change_column :users, :latitude, :float
  end
end
