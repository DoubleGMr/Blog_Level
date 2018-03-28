class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :email
      t.string :name
      t.string :introduce
      t.text :content

      t.timestamps
    end
  end
end
