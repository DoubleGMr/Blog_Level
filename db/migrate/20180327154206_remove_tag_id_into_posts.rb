class RemoveTagIdIntoPosts < ActiveRecord::Migration[5.1]
  def change
  	remove_index :posts, :tag_id
  end
end
