class AddNewMessageFlag < ActiveRecord::Migration
  def up
    add_column :messages, :new, :boolean, :default => true
  end

  def down
    remove_column :messages, :new
  end
end

