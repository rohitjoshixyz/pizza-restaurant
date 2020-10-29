class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.string :name
      t.decimal :percent, :precision => 2, :scale => 2
      t.decimal :amount, :precision => 2, :scale => 2
      t.timestamps
    end
  end
end
