class AddUserToNumber < ActiveRecord::Migration
  def up
    add_column :numbers, :user_id, :string
    add_column :numbers, :verified, :boolean
  end

  def down
    remove_column :numbers, :user_id
    remove_column :numbers, :verified
  end
end
