class TopController < ApplicationController
    def main
        if session[:login_uid]
            render "main"
        else
            render "login"
        end
    end
    
    def login
        user = User.find_by(uid: params[:uid])
        
        if user && user.authenticate(params[:pass])
            session[:login_uid] = user.uid
            redirect_to top_main_path
        else
            render "error", status:422
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
