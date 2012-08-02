class PaymentsController < ApplicationController

  def charge
 		Stripe.api_key = "LX8x4mAX9T66DELWR7esRfj7gE532KGY"
		@token = params[:stripeToken]
		 render :text => @token.inspect
		charge = Stripe::Charge.create(
  		:amount => 1000, # amount in cents, again
  		:currency => "usd",
  		:card => @token,
 		 :description => "Test Charge From HarvestGeek"
		)

  end

	def new

	end


  
end
