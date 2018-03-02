class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :category
      t.text :remarks

      t.timestamps
    end
  end
end
