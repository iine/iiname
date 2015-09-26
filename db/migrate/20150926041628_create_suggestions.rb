class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.text :keyword

      t.timestamps null: false
    end
  end
end
