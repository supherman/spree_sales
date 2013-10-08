class AddVariantIdToSpreeSales < ActiveRecord::Migration
  def change
    add_column :spree_sales, :variant_id, :integer
    add_index :spree_sales, [:variant_id], :name => "index_spree_sales_variant"
  end
end
