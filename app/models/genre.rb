class Genre < ActiveHash::Base

  include ActiveHash::Associations
  has_many :items

  self.data = [
    {id: 1, name: '--'}
    {id: 2, name: 'レディース' }
    {id: 3, name: 'メンズ'}
    {id: 4, name: 'ベビー・キッズ'}
    {id: 5, name: 'インテリア・住まい・子供'}
    {id: 6, name: '本・音楽・ゲーム'}
    {id: 7, name: 'おもちゃ・ホビー・グッズ'}
    {id: 8, name: '家電・スマホ・カメラ'}
    {id: 9, name: 'スポーツ・レジャー'}
    {id: 10, name: 'ハンドメイド'}
  ]

  self.data = [
    {id: 1, name: '--'}
    {id: 2, name: '新品・未使用' }
    {id: 3, name: '未使用に近い'}
    {id: 4, name: '目立った傷汚れなし'}
    {id: 5, name: 'やや傷や汚れあり'}
    {id: 6, name: '傷や汚れあり'}
    {id: 7, name: '全体的に状態が悪い'}
  ]

  self.data = [
    {id: 1, name: '--'}
    {id: 2, name: '着払い(購入者負担)' }
    {id: 3, name: '送料込み(出品者負担)'}
  ]

  self.data = [
    {id: 2, name:'北海道'}
    {id: 3,name:'青森県'}
    {id: 4,neme: '岩手県'}
    {id: 5,name: '宮城県'}
    {id: 6,name: '秋田県'}
    {id: 7,name:'山形県'}
    {id: 8,name: '福島県'}
    {id: 9,name: '茨城県'}
    {id: 10,name: '栃木県'}
    {id: 11,name: '群馬県'}
    {id: 12,name: '埼玉県'}
    {id: 13,name: '千葉県'}
    {id: 14,name: '東京都'}
    {id: 15,name: '神奈川県'}
    {id: 16,name: '新潟県'}
    {id: 17,name: '富山県'}
    {id: 18,name: '石川県'}
    {id: 19,name: '福井県'}
    {id: 20,name: '山梨県'}
    {id: 21,name: '長野県'}
    {id: 22,name: '岐阜県'}
    {id: 23,name: '静岡県'}
    {id: 24,name: '愛知県'}
    {id: 25,name: '三重県'}
    {id: 26,name: '滋賀県'}
    {id: 27,name: '京都府'}
    {id: 28,name: '大阪府'}
    {id: 29,name: '兵庫県'}
    {id: 30,name: '奈良県'}
    {id: 31,name: '和歌山県'}
    {id: 32,name: '鳥取県'}
    {id: 33,name: '島根県'}
    {id: 34,name: '岡山県'}
    {id: 35,name: '広島県'}
    {id: 36,name: '山口県'}
    {id: 37,name: '徳島県'}
    {id: 38,name: '香川県'}
    {id: 39,name: '愛媛県'}
    {id: 40,name: '高知県'}
    {id: 41,name: '福岡県'}
    {id: 42,name: '佐賀県'}
    {id: 43,name: '長崎県'}
    {id: 44,name: '熊本県'}
    {id: 45,name: '大分県'}
    {id: 46,name: '宮崎県'}
    {id: 47,name: '鹿児島県'}
    {id: 48,name: '沖縄県'}
  ]

  self.data = [
    {id: 1, name: '--'}
    {id: 2, name:'1~2日で発送'}
    {id: 3, name:'2~3日で発送'}
    {id: 4, name:'4~7日で発送'}
  ]
end