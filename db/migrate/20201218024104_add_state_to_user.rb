class AddStateToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :state, :string, default: 'user'
  end
end
