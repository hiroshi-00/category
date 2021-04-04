class Table < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_prefectures, :prefecture, foreign_key: true
  end
end
