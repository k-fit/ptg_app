require 'spec_helper'

describe "Localtrade pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "localtrade creation" do
    before { visit new_localtrade_path }

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

      before { fill_in 'localtrades_form_volume', with: 10 }
      before { fill_in 'localtrades_form_price', with: 2.34 }
      before { select "IVG", :from => 'localtrades_form_broker' }
      before { select "CU", :from => 'localtrades_form_contract_type' }
      before { select 'Buy' }
      before { fill_in 'localtrades_form_settlement', with: "Apr-14" }
      before { check 'localtrades_form_commission' }
      before { fill_in 'localtrades_form_trader', with: "Test" }
      before { fill_in 'localtrades_form_trade_date', with: Date.today }
      
      it "should create a localtrade" do
        expect { click_button "Submit Trade" }.to change(Localtrade, :count).by(1)
      end
    end

    describe "Home page has links" do
      before { visit root_path}
      it { should have_content "Multi Trade"}
      it { should have_content "Single Trade"}
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