class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.datetime  :date_time
      t.text       :comment

      t.references :user, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
