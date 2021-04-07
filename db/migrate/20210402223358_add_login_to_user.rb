class AddLoginToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :login, :string
    User.reset_column_information
    #https://guides.rubyonrails.org/v3.2/migrations.html#using-models-in-your-migrations
    # https://davidverhasselt.com/set-attributes-in-activerecord/
    User.all.each do |user|
      user.update_attribute(:login, user.last_name.downcase)
    end
  end
end
