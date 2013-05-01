# == Schema Information
#
# Table name: clearports
#
#  id             :integer          not null, primary key
#  trade_id       :string(255)
#  report_id      :string(255)
#  execution_id   :string(255)
#  trade_match_id :string(255)
#  trade_date     :string(255)
#  trade_type     :integer
#  instrument_id  :string(255)
#  sec_type       :string(255)
#  future_month   :string(255)
#  report_side    :integer
#  price          :float
#  quantity       :float
#  quantity_type  :string(255)
#  CME_broker     :string(255)
#  broker         :string(255)
#  trader         :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Clearport < ActiveRecord::Base
  attr_accessible :trade_id, :report_id, :execution_id, :trade_match_id, :trade_date, :trade_type, :instrument_id, 
  	:sec_type, :future_month, :report_side, :price, :quantity, :quantity_type, :CME_broker, :broker,
  	:trader

  validates :trade_id, presence: true, length: { minimum: 3 }
  validates :report_id, presence: true, length: { minimum: 3 }
  validates :execution_id, presence: true, length: { minimum: 3 }
  validates :trade_match_id, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :trade_date, presence: true, length: { minimum: 3 }
  validates :trade_type, presence: true
  validates :instrument_id, presence: true
  validates :sec_type, presence: true, length: { minimum: 3 }
  validates :future_month, presence: true, length: { minimum: 3 }
  validates :report_side, presence: true
  validates :price, presence: true, :numericality => { :greater_than => 0 }
  validates :quantity, presence: true, :numericality => { :greater_than => 0 }
  validates :quantity_type, presence: true
  validates :CME_broker, presence: true, length: { minimum: 3 }
  validates :broker, presence: true, length: { minimum: 3 }
  validates :trader, presence: true, length: { minimum: 3 }

  default_scope order: 'clearports.created_at DESC'
  
end
