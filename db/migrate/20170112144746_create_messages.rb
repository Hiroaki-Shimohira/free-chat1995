class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.string :image
      t.integer :user_id, index: true
      t.integer :chat_group_id, index:true

      t.timestamps
    end
  end
end
