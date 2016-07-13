class Video < ActiveRecord::Base

  belongs_to :user, inverse_of: :videos

  mount_uploader :file, BaseUploader

  validates :title, :file, presence: true

  before_validation :get_filename_from_file

  def tags
    []
  end

  private

  def get_filename_from_file
    if title.blank? && new_record?
      self.title = file.file.original_filename
    end
  end


end
