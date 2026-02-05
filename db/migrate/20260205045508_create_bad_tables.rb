class CreateBadTables < ActiveRecord::Migration[7.1]
  def change
    create_table :bad_tables do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
