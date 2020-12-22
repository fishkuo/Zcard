class AddStateToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :state, :string, default: 'open'
  end
end
