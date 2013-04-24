class Multitrade
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor(
    :contract_type, 
    :volume, 
    :price, 
    :price2, 
    :broker, 
    :trader, 
    :commission, 
    :buy1, 
    :settlement1, 
    :buy2, 
    :settlement2, 
    :buy3, 
    :settlement3, 
    :buy4, 
    :settlement4, 
    :buy5, 
    :settlement5,
    :buy6, 
    :settlement6, 
    :trade_date)

  validates :contract_type, presence: true, length: {minimum: 2}
  validates :volume, presence: true, :numericality => { :greater_than => 0 }
  validates :price, presence: true, :numericality => { :greater_than => 0 }
  validates :broker, presence: true, length: {minimum: 3}
  validates :trader, presence: true, length: {minimum: 3}
  validates :commission, :inclusion => {:in => ["1", "0"]}
  validates :buy1, :inclusion => {:in => ["true", "false"]}
  validates :settlement1, :format => {:with => /^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|)-\d{2}$/}
  validates :buy2, :inclusion => {:in => ["true", "false"]}, :if => "!settlement2.empty?"
  validates :buy3, :inclusion => {:in => ["true", "false"]}, :if => "!settlement3.empty?"
  validates :buy4, :inclusion => {:in => ["true", "false"]}, :if => "!settlement4.empty?"
  validates :buy5, :inclusion => {:in => ["true", "false"]}, :if => "!settlement5.empty?"
  validates :buy6, :inclusion => {:in => ["true", "false"]}, :if => "!settlement6.empty?"
  validates :settlement2, :format => {:with => /^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|)-\d{2}$/}, :if => "buy2 == 'true'"
  validates :settlement3, :format => {:with => /^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|)-\d{2}$/}, :if => "buy3 == 'true'"
  validates :settlement4, :format => {:with => /^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|)-\d{2}$/}, :if => "buy4 == 'true'"
  validates :settlement5, :format => {:with => /^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|)-\d{2}$/}, :if => "buy5 == 'true'"
  validates :settlement6, :format => {:with => /^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|)-\d{2}$/}, :if => "buy6 == 'true'"


  def initialize(attributes={}) 
    attributes.each do |name, value|  
      send("#{name}=", value)  
    end  
  end

  def persisted?  
    false  
  end  
  
  def create_trades(user)
    counter = 0
    localtrade_hash = Hash.new
    localtrade_hash[:broker] = self.broker
    localtrade_hash[:contract_type] = self.contract_type
    localtrade_hash[:trader] = self.trader
    localtrade_hash[:trade_date] = self.trade_date
    localtrade_hash[:volume] = self.volume
    localtrade_hash[:commission] = self.commission

    buys = [self.buy1, self.buy2, self.buy3, self.buy4, self.buy5, self.buy6]
    settlements = [self.settlement1, self.settlement2, self.settlement3, self.settlement4, self.settlement5, self.settlement6]
    prices = [self.price.to_f] * 6
    if self.price2.to_f > 0
      if !buys[5].empty?
        prices[3] = prices[4] = prices[5] = self.price2.to_f
      elsif !buys[3].empty?
        prices[2] = prices[3] = self.price2.to_f
      elsif !buys[1].empty?
        prices[1] = self.price2.to_f
      end
    end

    counter = 0
    trades = []

    buys.zip(settlements, prices).each do |buy, settlement, price|
      if buy.empty?
        break
      else
        counter += 1
        localtrade_hash[:buy] = buy
        localtrade_hash[:settlement] = settlement
        localtrade_hash[:price] = price
        @localtrade = user.localtrades.build(localtrade_hash)
        if !@localtrade.valid?
          return @localtrade.errors.full_messages, counter
        end
        trades.append(@localtrade)
      end
    end
    trades.each do |trade|
      trade.save
    end
    return [], counter
  end

 end
