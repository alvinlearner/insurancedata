class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :rate
      t.integer :excessprotector
      t.integer :pvt
      t.integer :lossofuse
      t.integer :pcf
      t.integer :itl
      t.integer :stampduty

      t.timestamps
    end
  end
end
