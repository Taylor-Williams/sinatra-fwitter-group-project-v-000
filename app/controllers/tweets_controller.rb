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
      erb :login
    end
  end

  get '/tweets/:slug' do
    erb :"/tweets/show"
  end

  get '/tweets/:slug/edit' do
    erb :"/tweets/edit"
  end

  post '/tweets' do
    if !params[:content].empty?
      current_user.tweets.create_tweet(content: params[:content])
    end
    redirect "/tweets"
  end

  post '/tweets/:slug/edit' do
    redirect "/tweets/#{params[:slug]}/edit"
  end

end
