class RemoveCategoryFromContacts < ActiveRecord::Migration[5.1]
  def change
    remove_column :contacts, :category, :string
  end
end
