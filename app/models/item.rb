class Item < ApplicationRecord
  has_many :cart_items,dependent: :destroy
  has_many :order_details,dependent: :destroy
  attachment :image

# 税込金額の計算 小数点切り捨て
  def taxin_price
    (price * 1.10).floor
  end
end
