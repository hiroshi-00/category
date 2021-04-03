class Prefecture < ApplicationRecord
  has_many :birth, class_name: "UserPrefecture", foreign_key: :birthplace_id
  has_many :locate, class_name: "UserPrefecture", foreign_key: :current_location_id
end
