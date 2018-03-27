class AddTagIdToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :tag_id, :bigint
  end
end
