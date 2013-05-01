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

require 'spec_helper'

describe Localtrade do

  let(:user) { FactoryGirl.create(:user) }
  before do
    	@localtrade = user.localtrades.build(buy: true, contract_type: "CU",
    	settlement: "Apr-13", volume: 10.0, price: 2.5, broker: "IVG",
    	commission: true, trader: "Matt", trade_date: Date.today) 
  end

  subject { @localtrade }

  it { should respond_to(:buy) }
  it { should respond_to(:contract_type) }
  it { should respond_to(:settlement) }
  it { should respond_to(:volume) }
  it { should respond_to(:price) }
  it { should respond_to(:broker) }
  it { should respond_to(:commission) }
  it { should respond_to(:trader) }
  it { should respond_to(:trade_date) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @localtrade.user_id = nil }
    it { should_not be_valid }
  end

  describe "when broker is not present" do
  	before { @localtrade.broker = nil}
  	it {should_not be_valid}
  end

  describe "when volume is not present" do
  	before { @localtrade.volume = nil}
  	it {should_not be_valid}
  end

  describe "when volume is not positive" do
  	before { @localtrade.volume = 0}
  	it {should_not be_valid}
  end

  describe "when price is not present" do
  	before { @localtrade.price = nil}
  	it {should_not be_valid}
  end

  describe "when price is not positive" do
  	before { @localtrade.price = 0.0}
  	it {should_not be_valid}
  end

  describe "when contract_type is not present" do
  	before { @localtrade.contract_type = nil}
  	it {should_not be_valid}
  end

  describe "when contract_type is not from predefined" do
  	before { @localtrade.contract_type = "AH"}
  	it {should_not be_valid}
  end

  describe "when buy is not present" do
  	before { @localtrade.buy = nil}
  	it {should_not be_valid}
  end

  describe "when settlement is not present" do
  	before { @localtrade.settlement = nil}
  	it {should_not be_valid}
  end

  describe "when settlement is not of right format" do
  	before { @localtrade.settlement = "Ap-13"}
  	it {should_not be_valid}
  end

  describe "when commission is not present" do
  	before { @localtrade.commission = nil}
  	it {should_not be_valid}
  end

  describe "when trader is not present" do
  	before { @localtrade.trader = nil}
  	it {should_not be_valid}
  end

  describe "when trade date is not present" do
  	before { @localtrade.trade_date = nil}
  	it {should_not be_valid}
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Localtrade.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  
end
