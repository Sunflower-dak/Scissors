class API::V1::ShortenedUrlsController < ApplicationController

    before_action :authenticate_user!


    def create 
        @url = ShortenedUrl.create(original_url: params[:original_url])
        @url.update!(user: current_user) if current_user
        @url.update!(short_url: "#{request.base_url}/#{@url.sanitize_url}")

        render json: {short_link: @url.short_url}
    end

    def redirect
        @url = ShortenedUrl.find_by(sanitize_url: params[:code])
        clean_url = @url.original_url.gsub(/^w{4}\./, "")
        redirect_to URI::HTTP.build(host: clean_url).to_s, allow_other_host: true 
    end


    def authenticate_user!
        return if current_user == @user 
  
        render json: { errors: ["You need to sign in or sign up"] }, status: :unauthorized
    end

end
