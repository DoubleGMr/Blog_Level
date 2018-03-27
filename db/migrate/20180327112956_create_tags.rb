class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.text :introduce

      t.timestamps
    end

    add_index :tags, :name, unique: true
  end
end
