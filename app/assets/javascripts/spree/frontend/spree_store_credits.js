
$(document).ready(function(){
	if ($("#have_a_coupon_code").prop("checked")) {
       	    $("#AmazonPayButton").hide();
       	    $("#AboutCouponCode").show();
             }
       	else
             {
            $("#AboutCouponCode").hide();
       	    $("#AmazonPayButton").show();
             }

	$("#have_a_coupon_code").click(function(){
       if ($(this).prop("checked")) {
       	    $("#AmazonPayButton").hide();
       	    $("#AboutCouponCode").show();
             }
       	else
             {
            $("#AboutCouponCode").hide();
       	    $("#AmazonPayButton").show();
             }
       
});

});

