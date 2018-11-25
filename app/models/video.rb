class Video < ApplicationRecord
  belongs_to :user

  validates :name, :url, presence: :true
  validate :format_url, if: :url

  def add_view
    self.views += 1
    save
  end

  private

  def format_url
    if url.end_with?('.m3u8')
      return true
    else
      errors.add(:url, :format, message: "with invalid format, please insert a .m3u8 file")

      return false
    end
  end
end
