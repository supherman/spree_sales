class AddTypeToSpreeSalesVariants < ActiveRecord::Migration
  def change
    add_column :spree_sales_variants, :type, :string
  end
end
