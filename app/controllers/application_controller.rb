require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ilovegames"
  end

  get '/' do
    erb :index
  end

  helpers do 
    # use helper methods or remove methods that are not being used
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=You need to be logged in to do that"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      if @user
        return @user
      else
        @user = User.find(session[:user_id])
      end
    end
  end
end