class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.string :language, null: false

      t.timestamps null: false
    end
  end
end
