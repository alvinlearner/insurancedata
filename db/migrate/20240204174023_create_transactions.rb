class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :client, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.string :policyno
      t.string :reg
      t.integer :proposed
      t.date :start
      t.date :expire
      t.string :classification

      t.timestamps
    end
  end
end
