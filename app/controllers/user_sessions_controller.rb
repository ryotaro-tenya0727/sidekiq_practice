class UserSessionsController < ApplicationController
  protect_from_forgery except: :callback

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user

      redirect_back_or_to root_path
    else

      render :new
    end
  end

  def callback
    key_source = Google::Auth::IDTokens::JwkHttpKeySource.new("https://www.googleapis.com/oauth2/v3/certs")
    Google::Auth::IDTokens::Verifier.new(key_source: key_source).verify(params[:credential], aud: ENV['GOOGLEAUTH_ID'])
    redirect_back_or_to root_path
  end

  def destroy
    logout
    redirect_to root_path
  end
end
