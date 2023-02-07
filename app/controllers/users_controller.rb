class UsersController < ApplicationController

  before_action :authorize
  skip_before_action :authorize, only: [:create]

  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def self
    user = User.find(session[:user_id])
    if user
      render json: user, status: :ok
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  def get_friends
    user = User.find(params[:user_id])
    friends = user.friends
    if friends.size > 0
      render json: friends, status: :ok
    else
      render json: { errors: "Sorry, you have no friends" }, status: :not_found
    end
  end

  def get_games
    user = User.find(params[:user_id])
    games = user.games
    if games.size > 0
      gamePackages = games.map {|game| {game: {**game.attributes, host: game.host.username, players: game.players}, board: game.board} }
      render json: gamePackages, status: :ok
    else
      render json: { errors: "Sorry, you have no games" }, status: :not_found
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.valid?
      render json: user, status: :accepted
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head :no_content
  end

  private

  def user_params
      params.permit(:username, :password, :email, :pic_url)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end