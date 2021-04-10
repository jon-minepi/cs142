class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :salt, :integer
    User.all.each do |user|
      salt = rand(1024)
      user.update_attribute(:password_digest, user.generate_password_digest(user.login, salt))
      user.update_attribute(:salt, salt)
    end
  end
end
