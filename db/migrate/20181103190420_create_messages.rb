class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.string :text, null: false
      t.string :external_chat_id, null: false
      t.timestamps
    end
  end
end
