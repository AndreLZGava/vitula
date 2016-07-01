class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_paper_trail_whodunnit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :notification_menu
  before_action :notification_count

  def notification_menu
    @notification_menu = Notification.where(read: nil, user_id: current_user.id).last(5)
  end

  def notification_count
    @notification_count = Notification.where(read: nil, user_id: current_user.id).count
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :phone, :born, :cpf, :rg, :address, :city, :language])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :phone, :born, :cpf, :rg, :address, :city, :language])
  end
end
