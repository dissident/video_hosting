class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :title
      t.string :file

      t.timestamps null: false
    end
  end
end
