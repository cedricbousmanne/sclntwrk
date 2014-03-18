class Asset < ActiveRecord::Base
  belongs_to :community
  belongs_to :author, class_name: User
  belongs_to :publication
  dragonfly_accessor :file

  validates :community, :author, presence: true

  before_validation :transliterate_file_name!
  after_create :save_file_data

  scope :images,    -> { where(image: true) }
  scope :documents, -> { where(image: false) }

  IMAGE_EXTENSIONS = %w{jpg JPG jpeg JPEG gif GIF png PNG}

  def transliterate_file_name!
    self.file.name = ActiveSupport::Inflector.transliterate file.name.downcase.gsub(/\s/,"_")
  end

  private

  def save_file_data
    update_attributes({
      name: file.name,
      size: file.size,
      image: IMAGE_EXTENSIONS.include?(file.name.split('.').last)
    })
  end
end
