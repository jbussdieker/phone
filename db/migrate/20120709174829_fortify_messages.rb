class FortifyMessages < ActiveRecord::Migration
  def up
    add_column :messages, :number, :string
  end

  def down
    remove_column :messages, :number
  end
end
