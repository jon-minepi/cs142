# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.datetime :date_time
      t.string :file_name, null: false

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
