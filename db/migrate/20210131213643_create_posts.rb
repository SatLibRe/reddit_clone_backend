class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :likecount
      t.integer :user_id

      t.timestamps
    end
  end
end
