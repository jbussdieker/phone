class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :CallSid
      t.string :Caller
      t.string :Called
      t.string :AccountSid
      t.string :CallStatus
      t.integer :CallDuration

      t.boolean :new, :default => true

      t.timestamps
    end
  end
end
