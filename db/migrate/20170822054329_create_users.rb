class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :uid
      t.string :avatar_url
      t.string :uid
      t.string :provider
      t.string :oauth_token

      t.timestamps
    end
  end
end
