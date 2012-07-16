class AddMailboxId < ActiveRecord::Migration
  def up
    add_column :messages, :mailbox_id, :integer
  end

  def down
    remove_column :messages, :mailbox_id
  end
end
