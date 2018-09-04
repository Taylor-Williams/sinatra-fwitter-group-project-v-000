class UsersController < ApplicationController

  get '/users' do
    erb :"/users/index"
  end

  get '/users/new' do
    erb :signup
  end

  get '/users/:slug' do
    erb :"/users/show"
  end

  get '/users/:slug/edit' do
    erb :"/users/edit"
  end

  post '/users/:slug/edit' do
    redirect "/users/#{params[:slug]}/edit"
  end

end
