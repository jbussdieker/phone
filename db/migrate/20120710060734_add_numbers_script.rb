class AddNumbersScript < ActiveRecord::Migration
  def up
    add_column :numbers, :script_id, :integer
  end

  def down
    remove_column :numbers, :script_id
  end
end
