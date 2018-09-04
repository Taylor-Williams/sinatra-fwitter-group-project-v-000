class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :"/tweets/index"
    else
      redirect '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :"/tweets/new"
    else
      redirect '/login'
    end
  end

  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      erb :"/tweets/show"
    else
      redirect 'login'
    end
  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.find(params[:id])
    erb :"/tweets/edit"
  end

  post '/tweets' do
    if !params[:content].empty?
      current_user.tweets.create(content: params[:content])
      redirect "/tweets"
    else
      redirect '/tweets/new'
    end
  end

  post '/tweets/:slug/edit' do
    redirect "/tweets/#{params[:slug]}/edit"
  end

end
