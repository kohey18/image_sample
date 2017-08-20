class AddPositionToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :position, :integer
  end
end
