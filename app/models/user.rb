class User < ApplicationRecord
  has_many :user_prefectures
  has_many :prefectures, through: :user_prefectures
  accepts_nested_attributes_for :user_prefectures
end
