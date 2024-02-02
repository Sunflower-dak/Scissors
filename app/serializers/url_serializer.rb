class UrlSerializer
  include FastJsonapi::ObjectSerializer
  attributes :shortened_url, :title, :description, :views_count, :id
end
