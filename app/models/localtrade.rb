# == Schema Information
#
# Table name: localtrades
#
#  id            :integer          not null, primary key
#  buy           :boolean
#  contract_type :string(255)
#  settlement    :string(255)
#  volume        :float
#  price         :float
#  broker        :string(255)
#  commission    :boolean
#  trader        :string(255)
#  user_id       :integer
#  trade_date    :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Localtrade < ActiveRecord::Base
  attr_accessible :broker, :buy, :commission, :contract_type, :price, :settlement, :trade_date, :trader, :volume
  belongs_to :user

  validates :user_id, presence: true
  validates :buy, :inclusion => {:in => [true, false]}
  validates :broker, presence: true
  validates :contract_type, presence: true, :format => {:with => /^(CU|71|EH|RB)$/}
  validates :commission, :inclusion => {:in => [true, false]}
  validates :price, presence: true, :numericality => { :greater_than => 0 }
  validates :volume, presence: true, :numericality => { :greater_than => 0 }
  validates :settlement, presence: true
  validates :settlement, :format => {:with => /^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|)-\d{2}$/}
  validates :trade_date, presence: true
  validates :trader, presence: true

  default_scope order: 'localtrades.created_at DESC'
end
