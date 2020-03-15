class AddLongitudeToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :longitude, :integer
  end
end
