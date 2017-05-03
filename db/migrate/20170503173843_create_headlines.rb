class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.string :title
      t.text :scraped_by

      t.timestamps null: false
    end
  end
end
