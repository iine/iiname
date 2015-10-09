class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :keyword

      t.timestamps null: false
    end
  end
end
