class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :admin
      t.decimal :amount, :precision => 2, :scale => 2
      t.timestamps
      t.string :status
      t.string :payment_mode
    end
  end
end
