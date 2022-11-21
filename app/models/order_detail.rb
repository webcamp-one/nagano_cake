class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  def with_tax_price
    (price*1.1).floor
  end
  
  def subtotal
    price.to_i*amount.to_i
  end
  
  enum production_status: {製作不可: 0,製作待ち: 1,製作中: 2,製作完了: 3}
end
