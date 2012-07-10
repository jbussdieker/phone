class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :value
      t.integer :script_id
      t.integer :type_id

      t.timestamps
    end
  end
end
