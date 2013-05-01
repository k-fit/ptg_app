require 'spec_helper'

describe "Clearport pages" do
	subject { page }

	describe "view page" do 
		let(:clearport) { FactoryGirl.create(:clearport)}
		before {visit clearport_path(clearport)}
		
		it { should have_selector('h1',    text: 'ClearPort Trade') }
		it { should have_selector('p',     text: 'Contract Type:') }
		it { should have_selector('p',     text: clearport.trade_type.to_s) }
		it { should have_selector('p',     text: 'Settlement Period:') }
		it { should have_selector('p',     text: clearport.future_month) }
		it { should have_selector('p',     text: 'Price:') }
		it { should have_selector('p',     text: clearport.price.to_s) }
		it { should have_selector('p',     text: 'Volume:') }
		it { should have_selector('p',     text: clearport.quantity.to_s) }
		it { should have_selector('p',     text: 'Broker:') }
		it { should have_selector('p',     text: clearport.broker) }
		it { should have_selector('p',     text: 'Clearport Trade Match ID:') }
		it { should have_selector('p',     text: clearport.trade_match_id) }
		it { should have_selector('p',     text: 'Trader:') }
		it { should have_selector('p',     text: clearport.trader) }		
		it { should have_selector('p',     text: 'Created At:') }
		it { should have_selector('p',     text: clearport.created_at.to_s) }
		
	end
end