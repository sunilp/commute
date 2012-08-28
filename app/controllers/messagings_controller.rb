class MessagingsController < ApplicationController
  before_filter :signed_in_user

  def create
    @user = User.find(params[:relationship][:to_id])
    current_user.domessage!(@user,params[:message])
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end