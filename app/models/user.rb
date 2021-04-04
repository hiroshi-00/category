class User < ApplicationRecord
  has_many :user_prefectures  # @user.user_prefectures
  has_many :prefectures, through: :user_prefectures  # @user.prefectures
  accepts_nested_attributes_for :user_prefectures
end
