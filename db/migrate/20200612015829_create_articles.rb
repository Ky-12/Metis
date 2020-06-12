class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title,null: false
      t.text :body,null:false
      t.references :user,null: false,foreign_key: true #記事を書いたユーザーの参照

      t.timestamps
    end
  end
end
