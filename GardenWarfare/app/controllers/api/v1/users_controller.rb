class Api::V1::UsersController < ApplicationController

  def create
    #params = { auth:{ provider: 'facebook', uid:'12adsashd71' } }

    if !params[:auth]
      render json: { error: "No encontramos el parámetro Auth" }
    else
      @user = User.from_omniauth(params[:auth])
      @token = @user.tokens.create()

      render "api/v1/users/show"  
    end 

  end
end
