class FacebookController < ApplicationController
  def authorize
    redirect_to "https://graph.facebook.com/oauth/access_token?client_id=115162228693126&redirect_uri=http://apps.facebook.com/sopanesobre-dev&client_secret=15e9f5c1460c9c5c5531996c5a1719d2&code=#{params[:code]}"
  end
  
  def authorize_callback
    access_token = client.authorization.process_callback(params[:code], :redirect_uri => 'http://sopaensobre.herokuapp.com/facebook/process_callback')
    session[:access_token] = access_token
    @client = session[:client].selection.me
  end
  
  def process_callback
    
  end
end
