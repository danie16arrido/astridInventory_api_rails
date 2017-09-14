class DevicesController < ApplicationController
  def index
    devices = Device.all
    render json: { status:'SUCCESS', message: 'Loaded devices', data:devices }, status: :ok
  end
end
