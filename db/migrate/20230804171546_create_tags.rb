class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|

      t.timestamps
      #最初は"type"というカラム名にしていたが、activestrogeを入れているとtypeというカラム名は使えなくなるため変更した
      t.string :category, null: false
      t.string :item, null: false
    end
  end
end
