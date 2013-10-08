Deface::Override.new(
  :virtual_path => "spree/admin/products/_form",
  :name => "add_admin_sale_price",
  :insert_top => "[data-hook='admin_product_form_right'], #admin_product_form_right[data-hook]",
  :sequence => 10,
  :text => %q{
  <%= f.field_container :sale_value do %>
    <%= f.label :sale_value, t(:sale_value) %>
    <%= f.text_field :sale_value %>
    <%= f.error_message_on :sale_value %>
  <% end %>
  <%= f.field_container :sale_start_at do %>
    <%= f.label :sale_start_at, t(:sale_start_at) %>
    <%= f.text_field :sale_start_at %>
    <%= f.error_message_on :sale_start_at %>
  <% end %>
  <%= f.field_container :sale_end_at do %>
    <%= f.label :sale_end_at, t(:sale_end_at) %>
    <%= f.text_field :sale_end_at %>
    <%= f.error_message_on :sale_end_at %>
  <% end %>
})
