class CreateLocaltrades < ActiveRecord::Migration
  def change
    create_table :localtrades do |t|
      t.boolean :buy
      t.string :contract_type
      t.string :settlement
      t.float :volume
      t.float :price
      t.string :broker
      t.boolean :commission
      t.string :trader
      t.integer :user_id
      t.date :trade_date

      t.timestamps
    end
    add_index :localtrades, [:user_id, :trade_date]
  end
end
