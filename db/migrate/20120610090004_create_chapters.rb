class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :nr_of_pages
      t.integer :book_id

      t.timestamps
    end
  end
end
