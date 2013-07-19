class RemoveVariantIdFromSales < ActiveRecord::Migration
  def change
    remove_index  :spree_sales, name: 'index_spree_sales_variant'
    remove_column :spree_sales, :variant_id
  end
end
