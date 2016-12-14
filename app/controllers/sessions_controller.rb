class SessionsController < ApplicationController
  skip_before_filter :verificar_autentificacao
  skip_before_action :verify_authenticity_token

  def new
    return redirect_to root_url if session[:user_id]
    layout_erp
  end

  def create
    status, resp = ::SessionsService.create(sessions_params)
    case status
    when :errors  then render json: { errors: resp }, status: :bad_request
    when :success
      session[:user_id] = resp[:id]
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def sessions_params
    attrs = [:email, :password]

    parm = params.require(:sessions).permit(*attrs)
    parm.deep_symbolize_keys
  end
end
