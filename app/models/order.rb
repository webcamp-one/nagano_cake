class Order < ApplicationRecord
  after_initialize :set_default
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: {credit_card: 0, transfer: 1}
  enum order_status: {入金待ち: 0,入金確認: 1,製作中: 2,発送準備中: 3,発送済み: 4}
  
  private
  
  def set_default
    self.postage ||= 800
  end
  
end
