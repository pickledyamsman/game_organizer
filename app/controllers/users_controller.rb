class UsersController < ApplicationController
  
  get '/users/:id' do
    if !logged_in?
      redirect '/games'
    else
      @user = current_user #uses helper method now
      erb :'users/show'
    end
  end
  
  get '/signup' do
    if !logged_in?
      erb :'users/new'
    else
      redirect to '/games'
    end
  end

  post '/signup' do
    @user = User.create(:username => params[:username], :password => params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/games'
    else
      redirect '/signup?error=You could not sign in'
    end
  end

  get '/login' do
    if logged_in?
      !session[:user_id]
      erb :'users/login'
    else
      redirect '/games'
    end
  end

  post '/login' do
    #helper method
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/games'
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/'
    else
      redirect '/'
    end
  end
end