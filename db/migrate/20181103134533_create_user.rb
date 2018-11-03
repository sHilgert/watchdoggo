class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :external_id, unique: true, null: false
      t.string :username, unique: true,  null: false
      t.timestamps
    end
  end
end
