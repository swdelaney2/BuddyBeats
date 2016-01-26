class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :user_name, uniqueness: true
      t.string :user_email, uniqueness: true
      t.string :password_digest
      t.boolean :is_admin
      t.string :auth_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at

      t.timestamps null: false
    end
  end
end
