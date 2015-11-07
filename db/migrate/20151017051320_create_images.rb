class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :url
      t.text :keyword

      t.timestamps null: false
    end
  end
end
