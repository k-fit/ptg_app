require 'spec_helper'

describe "Localtrade pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "localtrade creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a localtrade" do
        expect { click_button "Submit Trade" }.not_to change(Localtrade, :count)
      end

      describe "error messages" do
        before { click_button "Submit Trade" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'localtrade_volume', with: 10 }
      before { fill_in 'localtrade_price', with: 2.34 }
      before { fill_in 'localtrade_broker', with: "IVG" }
      before { fill_in 'localtrade_contract_type', with: "CU" }
      before { select 'Buy' }
      before { fill_in 'localtrade_settlement', with: "Apr-14" }
      before { check 'localtrade_commission' }
      before { fill_in 'localtrade_trader', with: "Test" }
      before { fill_in 'localtrade_trade_date', with: Date.today }
      
      it "should create a localtrade" do
        expect { click_button "Submit Trade" }.to change(Localtrade, :count).by(1)
      end
    end

    describe "with multi-trade option" do
      before { visit root_path(:multitrade_flag => 1)}
      it { should have_content "Multi-Trade Ticket"}
    end
  end

  describe "localtrade destruction" do
    before { FactoryGirl.create(:localtrade, user: user) }

    describe "as correct user" do
      before { visit user_path(user) }

      it "should delete a localtrade" do
        expect { click_link "delete" }.to change(Localtrade, :count).by(-1)
      end
    end
  end

  describe "index" do
  	before { visit localtrades_path }
  	it { should have_selector('title',    text: "Trades") }
  	it { should have_selector('h1',    	  text: "Entered Trades") }

  end


end