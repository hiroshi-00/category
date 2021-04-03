class UserPrefecture < ApplicationRecord
  belongs_to :user
  belongs_to :birthplace, class_name: "Prefecture"
  belongs_to :current_location, class_name: "Prefecture"
end
