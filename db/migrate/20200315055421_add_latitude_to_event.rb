class AddLatitudeToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :latitude, :integer
  end
end
