class ChangeIntegerColumnsToDecimal < ActiveRecord::Migration[7.1]
  def change
    change_column :companies, :rate, :decimal
    change_column :companies, :excessprotector, :decimal
    change_column :companies, :pvt, :decimal
    change_column :companies, :lossofuse, :decimal
    change_column :companies, :pcf, :decimal
    change_column :companies, :itl, :decimal
    change_column :companies, :stampduty, :decimal
  end
end
