class Fjdlkdjfldjflds < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :deleted_at, :datetime
    add_index :boards, :deleted_at
  end
end
