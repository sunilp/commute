class CreateMessagings < ActiveRecord::Migration
  def change
    create_table :messagings do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :message

      t.timestamps
    end

	add_index :messagings, :from_id
    add_index :messagings, :to_id

  end
end
