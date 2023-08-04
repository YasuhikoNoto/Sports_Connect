class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.integer :member_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :is_opened, null: false, default: true
    end
  end
end
