class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :created_at, :updated_at, :user
end
