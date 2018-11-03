class CreateSitesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :sites_users do |t|
      t.references :user, foreign_key: true
      t.references :site, foreign_key: true
    end
  end
end
