class Article < ApplicationRecord
  has_many :comments
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 140 }
  validates :text, presence: true, length: { maximum: 4000 }

  def subject
    title
  end

  def last_comment
    comments.last
  end

  def size_title_and_text
    title.length
    text.length
  end
end
