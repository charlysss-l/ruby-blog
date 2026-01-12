class MyArticle < ApplicationRecord
  validates :title, :body, presence: true
end
