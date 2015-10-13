class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.string :prefecture
      t.integer :prefecture_id

      t.timestamps null: false
    end
  end
end
