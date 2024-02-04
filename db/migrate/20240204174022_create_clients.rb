class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :krapin
      t.string :idno

      t.timestamps
    end
  end
end
