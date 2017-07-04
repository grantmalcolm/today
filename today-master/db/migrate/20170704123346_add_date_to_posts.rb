class AddDateToPosts < ActiveRecord::Migration
  def change
    # add the date the post was created
    add_column :posts, :thedate, :date
    # prevent duplicate user-post-date entries
    add_index :posts, [:user_id, :title, :thedate], unique: true
  end
end
