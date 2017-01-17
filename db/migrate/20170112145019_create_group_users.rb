class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.integer :user_id, index: true
      t.integer :chat_group_id, index: true

      t.timestamps
    end
  end
end
