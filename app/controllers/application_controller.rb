require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security_is_important"
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    if !logged_in?
      erb :signup
    else
      redirect '/tweets'
    end
  end

  post '/signup' do
    if !params[:username].empty? && !params[:password].empty?
      user = User.create(username: params[:username], password: params[:password])
      if user
        session[:user_id] = user.id
        redirect '/tweets'
      else
        redirect '/signup'
      end
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :login
    else
      redirect '/tweets'
    end
  end

  post '/login' do
    if !params[:username].empty? && !params[:password].empty? && !params[:email].empty?
      user = User.find_by(username: params[:username], password: params[:password], email: params[:email])
      if user
        session[:user_id] = user.id
        redirect '/tweets'
      else
        redirect '/login'
      end
    else
      redirect '/login'
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
