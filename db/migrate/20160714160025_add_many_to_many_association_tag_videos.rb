class AddManyToManyAssociationTagVideos < ActiveRecord::Migration
  def change
    create_table :tags_videos, id: false do |t|
      t.integer :video_id
      t.integer :tag_id
    end

    add_index :tags_videos, :video_id
    add_index :tags_videos, :tag_id
  end
end
