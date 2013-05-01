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

require 'spec_helper'

describe Clearport do
  before do  
  	@clearport = Clearport.new(trade_id: "123", report_id: "123", execution_id: "123",
  	trade_match_id: "456", trade_date: "12-12-2012", trade_type: 1, instrument_id: "1", 
  	sec_type: "678", future_month: "Apr-13",
  	report_side: 0, price: 1.0, quantity: 2.0, quantity_type: "1", CME_broker: "CME_broker", 
  	broker: "test", trader: "Joe")
  end

  subject { @clearport }

  it {should respond_to(:trade_id)}
  it {should respond_to(:report_id)}
  it {should respond_to(:execution_id)}
  it {should respond_to(:trade_match_id)}
  it {should respond_to(:trade_date)}
  it {should respond_to(:trade_type)}
  it {should respond_to(:instrument_id)}
  it {should respond_to(:sec_type)}
  it {should respond_to(:future_month)}
  it {should respond_to(:report_side)}
  it {should respond_to(:price)}
  it {should respond_to(:quantity)}
  it {should respond_to(:quantity_type)}
  it {should respond_to(:CME_broker)}
  it {should respond_to(:broker)}
  it {should respond_to(:trader)}

  it {should be_valid}

  describe "when price is not present" do
  	before { @clearport.price = nil }
  	it { should_not be_valid }
  end

  describe "when volume is not present" do
  	before { @clearport.quantity = "" }
  	it { should_not be_valid }
  end

  describe "when price is not positve" do
  	before { @clearport.price = 0 }
  	it { should_not be_valid }
  end
  
  describe "when volume is not positive" do
  	before { @clearport.quantity = 0 }
  	it { should_not be_valid }
  end

  describe "when id is too short" do
  	before { @clearport.trade_id = "12" }
  	it { should_not be_valid }
  end

  
end
