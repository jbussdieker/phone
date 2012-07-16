class AddCallSidToMessages < ActiveRecord::Migration
  def up
    add_column :messages, :CallSid, :string
  end

  def down
    remove_column :messages, :CallSid
  end
end
