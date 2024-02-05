class UrlSerializer
  include FastJsonapi::ObjectSerializer
  attributes :url, :title, :description, :views_count, :id
end
