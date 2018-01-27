class Artifact < ApplicationRecord
  attr_accessor :upload

  belongs_to :project

  validates_presence_of :name, :upload
  validates_uniqueness_of :name
  
  validate :uploaded_file_size
  
  MAX_FILESIZE = 10.megabytes

  def uploaded_file_size
    if upload
      errors.add(:upload, "File size must be less than  #{self.class::MAX_FILESIZE}") unless upload.filesize <= self.class::MAXFILESIZE
    end
  end
end
