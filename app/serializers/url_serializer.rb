class UrlSerializer
  include FastJsonapi::ObjectSerializer
  attributes :short_url, :title, :description, :views_count, :id
end
