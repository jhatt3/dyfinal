class AddLatitudeToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :latitude, :float
  end
end
