class CreateLocaltrades < ActiveRecord::Migration
  def change
    create_table :localtrades do |t|
      t.integer :buy
      t.string :content_type
      t.string :settlement_period
      t.float :price
      t.float :volume
      t.string :broker
      t.string :trader

      t.timestamps
    end
  end
end
