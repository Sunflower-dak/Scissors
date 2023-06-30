class API::V1::ShortenedUrlsController < ApplicationController

    before_create :authenticate_user!

    # def index
    #     @url = ShortenedUrl.new
    # end

    # def show
    #     redirect_to @url.sanitize_url
    # end

    # def create
    #     @url = ShortenedUrl.new
    #     @url.original_url = params[:original_url]
    #     @url.sanitize

    #     if @url.new_url
    #         if @url.save
    #             redirect_to shortened_path(@url.short_url)
    #         else
    #             flash[:error] = "Check the error below"
    #             render "index"
    #         end
    #     else
    #         flash[:notice] = "A short link for this URL is already in our database"
    #         redirect_to shortened_path(@url.find_duplicate.short_url)
    #     end
    # end

    # def shortened
    #     @url = ShortenedUrl.find_by_short_url(params[:short_url])
    #     host = request.host_with_port
    #     @original_url = @url.sanitize_url
    #     @short_url = host + '/' + @url.short_url
    # end

    # def fetch_original_url
    #     fetch_url = ShortenedUrl.find_by_short_url(params[:short_url])
    #     redirect_to fetch_url.sanitize_url
    # end

    # private

    # def find_url
    #     @url = ShortenedUrl.find_by_short_url(params[:short_url])
    # end

    # def url_params
    #     params.require(:url).permit(:original_url)
    # end

    def create 
        @url = ShortenedUrl.create(original_url: params[:original_url])
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
