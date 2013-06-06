class FacebookController < ApplicationController
  def authorize
    client = FBGraph::Client.new(:client_id => '114212485420577',:secret_id =>'d61d6dc8d2c7aa636f5826891973598a')
    session[:client] = client
    redirect_to client.authorization.authorize_url(:redirect_uri => 'http://sopaensobre.herokuapp.com/FacebookController/authorize_callback' , :scope => 'email,user_photos')
  end
  
  def authorize_callback
    access_token = client.authorization.process_callback(params[:code], :redirect_uri => 'http://sopaensobre.herokuapp.com/FacebookController/process_callback')
    session[:access_token] = access_token
    @client = session[:client].selection.me
  end
  
  def process_callback
    
  end
end
