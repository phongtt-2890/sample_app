class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  scope :newest, ->{order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true,
            length: {maximum: Settings.micropost_length}
  validates :image, content_type: {in: %w(image/jpeg image/gif image/png),
                                   message: I18n.t("must_be_valid")},
            size: {less_than: Settings.max_image_size.megabytes,
                   message: I18n.t("oversize_image")}
  def display_image
    image.variant resize_to_limit: Settings.limit_size
  end
end
