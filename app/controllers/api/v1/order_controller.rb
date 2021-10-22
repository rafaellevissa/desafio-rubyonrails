class Api::V1::OrderController < ApplicationController
  def index
    @orders = Order.all
    render json: {
      status: 200,
      data: @orders
    }
  end

  def show
    @order = Order.find(params[:id])

    render json: {
      status: 200,
      data: @order
    }
  end

  def create
    unless User.exists?(id: validator[:user_id])
      return render status: 404, json: {
        status: 404,
        error: 'User not found!'
      }
    end

    @order = Order.new(validator)

    @order.valid? && @order.save

    render json: {
      status: 200,
      data: @order
    }
  end

  def update
    unless !validator[:user_id] || User.exists?(validator[:user_id])
      return render status: 404, json: {
        status: 404,
        error: 'User not found!'
      }
    end

    @order = Order.find(params[:id])

    if @order.update(validator)
      render json: {
        status: 200,
        data: validator
      }
    end
  end

  def destroy
    @order = Order.find(params[:id])

    if @order.destroy
      render json: {
        status: 200,
      }
    end
  end

  private

  def validator
    params.permit(
      :model,
      :imei,
      :value,
      :user_id,
      :installments
    )
  end
end
