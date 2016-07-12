class Video < ActiveRecord::Base

  belongs_to :user, inverse_of: :video

  mount_uploaders :file, BaseUploader

  validates :title, :file, presence: true
end
