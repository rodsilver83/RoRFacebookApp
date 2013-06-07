require 'open-uri'

class AppPagesController < ApplicationController
  after_filter :allow_iframe
  def allow_iframe
    response.headers["X-Frame-Options"] = "GOFORIT"
  end
  def index
    @code = params[:code]
    if !@code.empty?
      conn = open("https://graph.facebook.com/oauth/access_token?client_id=115162228693126&redirect_uri=https://apps.facebook.com/sopanesobre-dev/&client_secret=15e9f5c1460c9c5c5531996c5a1719d2&code=#{@code}")
      data = conn.read
      dataparsed = CGI::parse(data)
      @accessToken = dataparsed["access_token"][0]
      session[:accessToken] = @accessToken
      
      conn2 = open("https://graph.facebook.com/me?fields=email,name,gender,birthday,first_name,last_name&access_token=#{@accessToken}")
      data = conn2.read
      @user = ActiveSupport::JSON.decode(data)
      session[:userFB] = @user
      render "index"
    else
      render "auth"
    end
  end

  def step1
  end

  def register
    render 'step2'
  end

  def step2

  end
end
