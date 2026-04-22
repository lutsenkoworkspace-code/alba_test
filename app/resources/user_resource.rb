class UserResource
  include Alba::Resource

  attributes :id, :name, :email
  many :articles, resource: ArticleResource
end
