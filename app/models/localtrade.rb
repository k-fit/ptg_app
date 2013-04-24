class Localtrade < ActiveRecord::Base
  attr_accessible :broker, :buy, :commission, :contract_type, :price, :settlement, :trade_date, :trader, :volume
  belongs_to :user

  validates :user_id, presence: true
  validates :buy, :inclusion => {:in => [true, false]}
  validates :broker, presence: true
  validates :contract_type, presence: true
  validates :commission, :inclusion => {:in => [true, false]}
  validates :price, presence: true, :numericality => { :greater_than => 0 }
  validates :volume, presence: true, :numericality => { :greater_than => 0 }
  validates :settlement, presence: true
  validates :settlement, :format => {:with => /^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|)-\d{2}$/}
  validates :trade_date, presence: true
  validates :trader, presence: true

  default_scope order: 'localtrades.created_at DESC'
end
