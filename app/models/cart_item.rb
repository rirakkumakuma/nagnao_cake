class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

 def taxin_price
    (item.price * 1.10).round
 end
  # 消費税込みの合計金額（税込価格X数量）
# def sum_of_price
  # item.taxin_price * quantity
# end
end
