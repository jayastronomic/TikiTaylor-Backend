class Api::V1::SessionsController < ApplicationController
  def create
    @admin = Admin.find_by(username: session_params[:username])      
    if @admin && @admin.authenticate(session_params[:password])
      login!
      render json: @admin, logged_in: true
    else
      render json: {  status: 401, error: 'invalid username or password'}
    end
  end

  def is_logged_in?
    if logged_in? && current_admin
      render json: current_admin, logged_in: true
    else
      render json: { username: "", logged_in: false }
    end
  end

  def destroy
    logout!
    render json: { username: "", logged_in: false }, status: :ok
  end

  private

  def session_params
    params.require(:admin).permit(:username, :password)
  end
end