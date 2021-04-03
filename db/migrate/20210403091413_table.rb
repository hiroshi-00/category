class Table < ActiveRecord::Migration[5.2]
  def change
    drop_table :relationships
    remove_column :prefectures, :birthplace_id, :integer
    remove_column :prefectures, :current_location_id, :integer
    add_column :user_prefectures, :birthplace_id, :integer
    add_column :user_prefectures, :current_location_id, :integer
    add_column :prefectures, :name, :string
  end
end
