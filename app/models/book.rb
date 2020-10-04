class Book < ApplicationRecord
  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
end
