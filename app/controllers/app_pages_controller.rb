class AppPagesController < ApplicationController
  def index
    client = FBGraph::Client.new(:client_id => '114212485420577',:secret_id =>'d61d6dc8d2c7aa636f5826891973598a')
    redirect_to client.authorization.authorize_url(:redirect_uri => 'http://sopaensobre.herokuapp.com/app_pages/paso1' , :scope => 'email,user_photos')
    @token = client
  end

  def step1
  end

  def register
    render 'step2'
  end

  def step2

  end
end
