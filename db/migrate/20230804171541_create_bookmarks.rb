class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|

      t.timestamps
      t.integer :member_id, null: false
      t.integer :post_id, null: false
    end
  end
end
