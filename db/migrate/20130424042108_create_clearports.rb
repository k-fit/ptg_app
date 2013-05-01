class CreateClearports < ActiveRecord::Migration
  def change
    create_table :clearports do |t|
      t.string :trade_id 
      t.string :report_id 
	  t.string :execution_id   
	  t.string :trade_match_id      
 	  t.string :trade_date
 	  t.integer :trade_type 
      t.string :instrument_id 
 	  t.string :sec_type 
 	  t.string :future_month 
 	  t.integer :report_side 
 	  t.float :price 
 	  t.float :quantity 
 	  t.string :quantity_type 
 	  t.string :CME_broker 
 	  t.string  :broker 
 	  t.string :trader

      t.timestamps
    end
  end
end
