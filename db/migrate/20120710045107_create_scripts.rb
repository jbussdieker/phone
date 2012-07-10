class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :name
      t.integer :number_id

      t.timestamps
    end
  end
end
