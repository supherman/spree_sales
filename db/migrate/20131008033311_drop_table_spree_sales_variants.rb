class DropTableSpreeSalesVariants < ActiveRecord::Migration
  def change
    drop_table :spree_sales_variants
  end
end
