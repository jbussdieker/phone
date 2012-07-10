class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.string :name
      t.string :number

      t.timestamps
    end
  end
end
