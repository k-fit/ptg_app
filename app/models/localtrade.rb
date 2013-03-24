class Localtrade < ActiveRecord::Base
  attr_accessible :broker, :buy, :content_type, :price, :settlement_period, :trader, :volume
  belongs_to :user
  validates :price, :numericality => true
end
