class API::V1::UrlsController < ApplicationController
  before_action :set_url, only: %i[show]

  def index
    @urls = Url.recent_first
    render json: UrlSerializer.new(@urls).serializable_hash[:data].map { |url| url[:attributes] }
  end

  def show

  end

  def create
    @url = Url.create!(url_params)
    @url.shortener
    if @url
      render json: UrlSerializer.new(@url).serializable_hash[:data][:attributes], status: :created
    else
      render json: { errors: @url.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def url_params
    params.permit(:url, :title, :description)
  end

  def set_url
    @url = Url.find(params[:url])
  end
end
