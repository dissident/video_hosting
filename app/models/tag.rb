class Tag < ActiveRecord::Base

  has_and_belongs_to_many :videos

  validates :title, presence: true
  validates :title, uniqueness: true

end
