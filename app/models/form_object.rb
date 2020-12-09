class FormObject
  include ActiveModel::Model
  attr_accessor :user_id,:item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_id, :token

  # ここにバリデーションの処理を書く

  with_options presence: true do
    validates :postal_code,     format: { with: /\A\d{3}[-]\d{4}\z/}     
    validates :prefecture_id,   numericality: { other_than: 1 }
    validates :city            
    validates :address
    validates :phone_number,    numericality: true,   length: { maximum: 11 }
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end