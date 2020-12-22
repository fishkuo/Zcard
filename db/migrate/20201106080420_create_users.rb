class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :nickname
      t.string :account
      t.string :avatar
      t.string :school

      t.timestamps
    end
  end
end
