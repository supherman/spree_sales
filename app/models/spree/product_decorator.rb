Spree::Product.class_eval do
  has_one :sale, through: :master
  accepts_nested_attributes_for :sale
end
