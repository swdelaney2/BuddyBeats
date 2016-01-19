class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :user_name, uniqueness: true
      t.string :user_email, uniqueness: true
      t.string :password_digest
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
