Deface::Override.new(
  :virtual_path => "spree/admin/shared/_configuration_menu",
  :name => "store_credits_admin_configurations_menu",
  :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
  :text => "<%= configurations_sidebar_menu_item Spree.t(:store_credits), admin_store_credits_url %>",
  :disabled => false)

Deface::Override.new(
  :virtual_path => "spree/admin/users/index",
  :name => "store_credits_admin_users_index_row_actions",
  :insert_bottom => "[data-hook='admin_users_index_row_actions']",
  :text => "<%= link_to_with_icon('icon-dollar', Spree.t('add_store_credit'), new_admin_user_store_credit_url(user), {no_text: true}) %>",
  :disabled => false)

if false 
Deface::Override.new(
  :virtual_path => "spree/checkout/_payment",
  :name => "store_credits_checkout_payment_step",
  :insert_after => "[data-hook='checkout_payment_step']",
  :partial => "spree/checkout/store_credits",
  :disabled => false)
end

Deface::Override.new(
  :virtual_path => "spree/users/show",
  :name => "store_credits_account_my_orders",
  :insert_after => "[data-hook='account_my_orders']",
  :partial => "spree/users/store_credits",
  :disabled => false)

Deface::Override.new(
  :virtual_path => "spree/admin/general_settings/edit",
  :name => "admin_general_settings_edit_for_sc",
  :insert_before => "[data-hook='buttons']",
  :partial => "spree/admin/store_credits/limit",
  :disabled => true)

Deface::Override.new(
  :virtual_path => "spree/checkout/_payment",
  :name => "remove coupon code from payment page",
  :remove => "[data-hook='coupon_code']",
  :disabled => false)


string1 = <<'HEREDOC'
 <erb silent> if session[:have_a_coupon_code] </erb> 
<input type='hidden' value='false' name='have_a_coupon_code'>
<input type='checkbox' value='true' name='have_a_coupon_code' id='have_a_coupon_code' checked> I have a coupon</input>
 <erb silent> else </erb> 
 <input type='hidden' value='false' name='have_a_coupon_code'>
<input type='checkbox' value='true' name='have_a_coupon_code' id='have_a_coupon_code'> I have a coupon</input>
 <erb silent> end </erb>
HEREDOC



Deface::Override.new(
  :virtual_path => "spree/orders/edit",
  :name => "remove coupon code from cart page",
  :replace => "erb[loud]:contains(':coupon_code')",
  :text => string1,
  :disabled => false)





