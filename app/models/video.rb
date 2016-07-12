class Video < ActiveRecord::Base
  belongs_to :user

  mount_uploaders :file, BaseUploader

  validates :title, :file, presence: true
end