class CreateSales < ActiveRecord::Migration
  def change
    create_table :spree_sales do |t|
      t.integer :variant_id
      t.decimal :value, :precision => 8, :scale => 2
      t.datetime :start_at
      t.datetime :end_at
      t.string :type
      t.timestamps
    end

    add_index :spree_sales, [:variant_id], :name => "index_spree_sales_variant"
  end
end
