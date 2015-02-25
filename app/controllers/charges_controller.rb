class ChargesController < ApplicationController
	def new
	end

	def create
		@amount = 500
		
		customer = Stripe::Customer.create(
			:email => 'Example@stripe.com',
			:card => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer 	 => customer.id,
			:amount 		 => @amount,
			:description => 'Rails Stripe customer',
			:currency		 => 'usd'
		)

	rescue
		flash[:error] = e.message
		redirect_to charges_path
	end
end
