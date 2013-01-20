class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.boolean :active, :default => true

      t.string :old_password_hash
      t.string :password_digest
      
      t.text :signature
      t.string :jabber
      t.string :icq
      t.string :twitter
      t.string :homepage
      
      t.string :city
      t.string :job
      t.date :birthday
      
      t.string :computer
      t.string :graphics
      t.string :distro
  
      t.boolean :minecraft_whitelisted, :default => false
      t.string :minecraft_username
      
      t.datetime :lastlogin
      t.integer :failed_logins, :default => 0

      t.timestamps
    end
  end
end
