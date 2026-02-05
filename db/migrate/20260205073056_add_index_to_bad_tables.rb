class AddIndexToBadTables < ActiveRecord::Migration[7.1]
  def change
    add_index :bad_tables, :user_id
  end
end

