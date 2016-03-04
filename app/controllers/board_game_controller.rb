class BoardGameController < ApplicationController

  get "/games" do
    redirect_if_not_logged_in
    @games = BoardGame.all
    erb :'board_games/index'
  end
  
  post "/games" do
    redirect_if_not_logged_in
    unless BoardGame.valid_params?(params)
      redirect "/games/new?error=invalid game"
    end
    BoardGame.create(params)
    redirect "/games"
  end

  get "/games/new" do
    redirect_if_not_logged_in
    erb :'board_games/new'
  end

  get "/games/:id/edit" do
    redirect_if_not_logged_in
    @game = BoardGame.find(params[:id])
    erb :'board_games/edit'
  end

  get "/games/:id" do
    redirect_if_not_logged_in
    @game = BoardGame.find(params[:id])
    erb :'board_games/show'
  end

  post "/games/:id" do
    redirect_if_not_logged_in
    @game = BoardGame.find(params[:id])
    unless BoardGame.valid_params?(params)
      redirect "/games/#{@game.id}/edit?error=invalid game"
    end
    @game.update(params.select{|k|k=="name" || k =="capacity"})
    redirect "/games/#{@game.id}"
  end

  get '/games/:id/delete' do
    redirect_if_not_logged_in
    @game = BoardGame.find(params[:id])
    @game.delete
    redirect "/games"
  end
end