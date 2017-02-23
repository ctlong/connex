class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :snapchat
      t.string :facebook
      t.string :linkedin
      t.string :instagram
      t.string :twitter

      t.timestamps
    end
  end
end
