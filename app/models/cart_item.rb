class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

# 小計金額の計算
def subtotal
  item.taxin_price * amount
end

  # 消費税込みの合計金額（税込価格X数量）
def total
  item.taxin_price * amount
end
end
