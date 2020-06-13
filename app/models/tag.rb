class Tag < ApplicationRecord
  #Tagsテーブルから中間テーブルに対する関連付け
  has_many :article_tag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :articles, through: :article_tag_relations

  #validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
