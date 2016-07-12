class Video < ActiveRecord::Base
  belongs_to :user

  validates :title, :file, presence: true
end
