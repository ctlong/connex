class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :phone
      t.string :snapchat
      t.string :facebook
      t.string :linkedin
      t.string :instagram
      t.string :twitter

      t.string :password_digest
      t.string :remember_digest

      t.timestamps
    end
  end
end
