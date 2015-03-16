class AddCustomerHasACouponToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :customer_has_a_coupon, :boolean
  end
end
