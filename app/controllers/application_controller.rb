class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token, raise: false

    include Authenticable


    

  
    # def test
    #   render json: { message: 'OK' }, status: :ok
    # end
end
