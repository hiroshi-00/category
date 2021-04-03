class Prefecture < ApplicationRecord
  has_many :user_prefectures
  has_many :users, through: :user_prefectures
end
