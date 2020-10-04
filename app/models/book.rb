class Book < ApplicationRecord
  # バリデーション
  validates :title, :body, presence: true
end
