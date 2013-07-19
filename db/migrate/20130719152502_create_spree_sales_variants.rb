class CreateSpreeSalesVariants < ActiveRecord::Migration
  def change
    create_table :spree_sales_variants do |table|
      table.belongs_to :variant
      table.belongs_to :sale

      table.timestamps
    end

    add_index :spree_sales_variants, :variant_id
    add_index :spree_sales_variants, :sale_id
  end
end
