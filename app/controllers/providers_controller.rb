class ProvidersController < ApplicationController

  def index
    providers = Provider.all
    render json: { status:'SUCCESS', message: 'Loaded providers', data:providers }, status: :ok
  end

  def create
    provider = Provider.new(provider_params)
    if provider.save
      render json: { status:'SUCCESS', message: 'Saved provider', data:provider }, status: :ok
    else
      render json: { status:'ERROR', message: 'Provider not saved', data:provider.errors }, status: :unprocessable_entity
    end
  end

  def show
    provider = Provider.find(params[:id])
    render json: { status:'SUCCESS', message: 'Loaded provider', data:provider }, status: :ok
  end

  def update
    provider = Provider.find(params[:id])
    if provider.update_attributes(provider_params)
      render json: { status:'SUCCESS', message: 'Updated provider', data:provider }, status: :ok
    else
      render json: { status:'ERROR', message: 'Provider not updated', data:provider.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    provider = Provider.find(params[:id])
    provider.destroy
    render json: { status:'SUCCESS', message: 'Deleted provider', data:provider }, status: :ok
  end

  private

  def provider_params
    params.permit(:name, :telephone, :email, :website)
  end
end
