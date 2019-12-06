class ApplicationController < ActionController::Base
    
    before_action :authorize, except: %i[auth new create authorize_user]

    def current_user
        @current_user ||= session[:current_user_id] &&
            User.find_by(id: session[:current_user_id])
    end

    def authorize
        unless current_user
            puts 'Пользователь не аутентифицирован!'
            redirect_to signin_path
        else
            puts "Пользователь: #{current_user.login}"
        end
    end
end
