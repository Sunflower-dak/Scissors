class API::V1::UrlsController < ApplicationController
  def index
    @urls = Url.recent_first
    render json: UrlSerializer.new(@urls).serializable_hash[:data].map { |url| url[:attributes] }
  end

  def create
    @url = Url.create!(url_params)
    if @url
      render json: UrlSerializer.new(@url).serializable_hash[:data][:attributes], status: :created
    else
      render json: { errors: @url.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def url_params
    params.permit(:original_url, :title, :description)
  end
end
