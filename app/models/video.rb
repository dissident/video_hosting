class Video < ActiveRecord::Base

  belongs_to :user, inverse_of: :videos
  has_and_belongs_to_many :tags, dependent: :nullify

  mount_uploader :file, BaseUploader

  validates :file, presence: true

  before_save :get_filename_from_file

  private

  def get_filename_from_file
    if title.blank? && new_record?
      self.title = file.file.original_filename
    end
  end


end
