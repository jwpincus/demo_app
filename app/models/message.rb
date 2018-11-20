class Message < ApplicationRecord
  validates_presence_of :external_created_at,
           :user_followers,
           :user_id,
           :message,
           :sentiment,
           :user_handle
  validates_uniqueness_of :message, scope: [:user_handle, :external_created_at]

  def self.coke_messages
    self.where("message ILIKE ANY(ARRAY['%coke%', '%coca-cola%', '%diet-cola%'])")
  end

end
