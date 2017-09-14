class DevicesController < ApplicationController

  def index
    devices = Device.all
    render json: { status:'SUCCESS', message: 'Loaded devices', data:devices }, status: :ok
  end

  def create
    device = Device.new(device_params)
    if device.save
      render json: { status:'SUCCESS', message: 'Saved device', data:device }, status: :ok
    else
      render json: { status:'ERROR', message: 'Device not saved', data:device.errors }, status: :unprocessable_entity
    end
  end

  private

  def device_params
    params.permit(:model, :make, :category_id)
  end


end
