class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.references :site, foreign_key: true
      t.integer :http_code, null: false
      t.timestamps
    end
  end
end
