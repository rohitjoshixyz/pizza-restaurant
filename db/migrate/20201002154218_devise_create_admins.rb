class DeviseCreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      ## Database authenticatable
      t.string :email, null: false, default: ''
      t.string :full_name
      t.string :uid
      t.string :avatar_url
      t.timestamps null: false
      t.references :cart, foreign_key: true
    end

    add_index :admins, :email, unique: true
  end
end
