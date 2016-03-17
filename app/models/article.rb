class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { case_sensitive: false}

  validates :body, presence: true
  validates :body, uniqueness: { case_sensitive: false}
end
