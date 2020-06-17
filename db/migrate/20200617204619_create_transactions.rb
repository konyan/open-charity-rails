class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :charity
      t.integer :donate_amount
      t.integer :net_amount
      t.string :currency
      t.string :trans_id
      t.string :direction
      t.string :origin

      t.timestamps
    end
  end
end
