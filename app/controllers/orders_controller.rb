class OrdersController < ApplicationController

  def index
    orders = Order.all
    render json: { status:'SUCCESS', message: 'Loaded orders', data:orders }, status: :ok
  end

  def create
    order = Order.new(order_params)
    order.status = "ordered"
    if order.save
      render json: { status:'SUCCESS', message: 'Saved order', data:order }, status: :ok
    else
      render json: { status:'ERROR', message: 'Order not saved', data:order.errors }, status: :unprocessable_entity
    end
  end

  def show
    order = Order.find(params[:id])
    render json: { status:'SUCCESS', message: 'Loaded order', data:order }, status: :ok
  end

  def update
    order = Order.find(params[:id])

    if order.update_attributes(order_params)
      render json: { status:'SUCCESS', message: 'Updated order', data:order }, status: :ok
    else
      render json: { status:'ERROR', message: 'Order not updated', data:order.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    render json: { status:'SUCCESS', message: 'Deleted order', data:order }, status: :ok
  end

  private

  def order_params
    params.permit(:status, :expected, :date_in, :date_out, :job, :device_id, :provider_id)
  end

end
