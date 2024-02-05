class API::V1::UrlsController < ApplicationController


  def index
    @urls = Url.recent_first
    render json: UrlSerializer.new(@urls).serializable_hash[:data].map { |url| url[:attributes] }
  end

  def show

  end

  def create
    @url = Url.create!(url_params)
    @url.update!(short_url: "#{request.base_url}/#{@url.short_code}")

    render json: { short_url: @url.short_url, short_code: @url.short_code }, status: :created
  end

  def redirect
    @url = Url.find_by(short_code: params[:short_code])
    return unless @url

    @url.increment!(:views_count)
    corrected_url = @url.original_url.gsub(/^w{4}\./, "")

    redirect_to URI::HTTP.build(host: corrected_url).to_s, allow_other_host: true
  end

  private

  def url_params
    params.permit(:original_url, :title, :description)
  end

end
