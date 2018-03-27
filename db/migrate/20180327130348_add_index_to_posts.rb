class AddIndexToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_index :posts, :tag_id, unique: true
  end
end
