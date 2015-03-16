module Spree
  OrdersController.class_eval do

    def update
    #  byebug
     if params.has_key?(:have_a_coupon_code) && params[:have_a_coupon_code]=="true"
        session[:have_a_coupon_code]=true
      end

     if params.has_key?(:have_a_coupon_code) && params[:have_a_coupon_code]=="false"
        session[:have_a_coupon_code]=false        
     end

      if @order.contents.update_cart(order_params)
        respond_with(@order) do |format|
          format.html do
            if params.has_key?(:checkout)
              @order.next if @order.cart?
              redirect_to checkout_state_path(@order.checkout_steps.first)
            else
              redirect_to cart_path
            end
          end
        end
      else
        respond_with(@order)
      end
    end

  end
end