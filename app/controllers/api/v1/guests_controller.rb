class Api::V1::GuestsController < ApplicationController

  def create
    @guest = Guest.new(first_name: guest_params[:first_name], last_name: guest_params[:last_name])
    if !!guest_params[:friend]
      @guest.build_friend(first_name: guest_params[:friend][:first_name], last_name: guest_params[:friend][:last_name])
    end
    if @guest.save
      render json: @guest
    else
      render json: { errors: @guest.errors.full_messages }
    end
  end

  def index
    @guests = Guest.where(friend_id: nil)
    render json: @guests
  end


  private

  def guest_params 
    params.require(:guest).permit(
      :first_name,
      :last_name,
      friend: [:first_name, :last_name]
    )
  end
end