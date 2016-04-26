class UsersController < ApplicationController
  
  get '/users/:id' do
    if !logged_in?
      redirect '/games'
    end
    @user = current_user #uses helper method now
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/games'
    end
  end
  
  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/games'
    end
  end

  post '/signup' do
    @user = User.create(:username => params[:username], :password => params[:password])
    session[:user_id] = @user.id
    redirect '/games'
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