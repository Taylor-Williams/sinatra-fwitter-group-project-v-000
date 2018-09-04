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
    erb :"/tweets/new"
  end

  get '/tweets/:slug' do
    erb :"/tweets/show"
  end

  get '/tweets/:slug/edit' do
    erb :"/tweets/edit"
  end

  post '/tweets' do
    redirect "/tweets/#{@tweet.slug}"
  end

  post '/tweets/:slug/edit' do
    redirect "/tweets/#{params[:slug]}/edit"
  end

end
