class Ariticle < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

 #空の投稿保存できない
 validates :title, text, presence: true

 #---の時保存できない
 validates :genre_id, numericality: { other_than: 1 }

end