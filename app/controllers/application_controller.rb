class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end

  def require_tutor
    if current_user.present?
      if current_user.role == "aluno"
        flash[:error] = "Você precisa ser um monitor para entrar nessa página!"
        redirect_to "/"
      end
    else
      flash[:error] = "Você precisa estar logado para entrar nessa página!"
      redirect_to "/"
    end
  end
end