class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.timestamps
      t.integer :member_id, null: false
      t.integer :post_id, null: false
      t.text :body, null: false
    end
  end
end
