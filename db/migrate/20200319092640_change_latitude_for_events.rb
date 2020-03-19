class ChangeLatitudeForEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :longitude, :float
    change_column :events, :latitude, :float

  end
end
