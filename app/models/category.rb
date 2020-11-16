class Category < ActiveHash::Base

  include ActiveHash::Associations
  has_many :items

  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: "レディース" },
    {id: 3, name: 'メンズ'},
    {id: 4, name: 'ベビー・キッズ'},
    {id: 5, name: 'インテリア・住まい・子供'},
    {id: 6, name: '本・音楽・ゲーム'},
    {id: 7, name: 'おもちゃ・ホビー・グッズ'},
    {id: 8, name: '家電・スマホ・カメラ'},
    {id: 9, name: 'スポーツ・レジャー'},
    {id: 10, name: 'ハンドメイド'},
    {id: 11, name: 'その他'}
  ]
end
end
