class MessagingsController < ApplicationController
  before_filter :signed_in_user
  protect_from_forgery :except => :auth # stop rails CSRF protection for this action
  connections = []
  

  def create
    puts "id is:"+ params[:messaging][:to_id].to_s
    @user = User.find_by_id(params[:messaging][:to_id])
   

    Pusher['private-'+params[:messaging][:to_id]].trigger('new_message'+params[:messaging][:to_id], {:from => current_user.name, :subject => 'talk',:message =>params[:messaging][:message] })
#Pusher['presence-openCommute'].trigger('new_message'+params[:messaging][:to_id], {:from => current_user.name, :subject => 'talk',:message =>params[:messaging][:message] })


    @messaging = Messaging.new({:from_id => current_user.id, :to_id => params[:messaging][:to_id], :message => params[:messaging][:message]})
    @messaging.save


    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def auth
    if current_user
      response = Pusher[params[:channel_name]].authenticate(params[:socket_id])
      render :json => response
    else
      render :text => "Not authorized", :status => '403'
    end
  end




  def destroy
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end