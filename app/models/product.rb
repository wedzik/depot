class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  validates :title, :description, :image_url, presence: true
  validates :price, numericality:  {greater_than_or_equal_to: 0.01}
  validates_uniqueness_of :title
  validates :image_url, allow_blank: true, format: {
                          with: %r{\.(gif|jpg|png)$}i,
                          message: "Url must set to image."
                      }
end
