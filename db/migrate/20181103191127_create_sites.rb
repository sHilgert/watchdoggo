class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :url, null: false, unique: true
      t.boolean :enabled, default: true, null: false
    end
  end
end
