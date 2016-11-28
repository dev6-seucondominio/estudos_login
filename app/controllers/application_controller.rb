class ApplicationController < ActionController::Base
  helper_method :current_user
  before_filter :verificar_autentificacao

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def options
    { user: current_user }
  end

  def verificar_autentificacao
    if current_user
      layout_erp
    else
      redirect_to :log_in
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def layout_erp
    render html: "", layout: 'application'
  end
end
