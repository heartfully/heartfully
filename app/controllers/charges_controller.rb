class ChargesController < ApplicationController
	def new
	end

	def create
    @amount = 500

    begin
      customer = Stripe::Customer.create(
        email: params[:email],
        card: params[:stripe],
        metadata: {
          project_name: "foo",
          price: "spend some money"
        }
      )

      Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        currency: 'usd',
        description: "testing card in customer obj"
      )

    rescue Exception => e
      flash[:error] = e.message
      render 'new'
    end
  end
end
