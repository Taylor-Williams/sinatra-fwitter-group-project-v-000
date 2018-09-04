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
    @tweet = Tweet.find(params[:id])
    erb :"/tweets/show"
  end

  get '/tweets/:slug/edit' do
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
