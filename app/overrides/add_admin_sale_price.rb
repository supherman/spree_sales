Deface::Override.new(
  :virtual_path => "spree/admin/products/_form",
  :name => "add_admin_sale_price",
  :insert_top => "[data-hook='admin_product_form_right'], #admin_product_form_right[data-hook]",
  :sequence => 10,
  :text => %q{
  <%= f.fields_for :sale do |sf| %>
    <%= sf.field_container :value do %>
      <%= sf.label :value, t(:sale_value) %>
      <%= sf.text_field :value %>
      <%= sf.error_message_on :value %>
    <% end %>
  <% end %>
})
