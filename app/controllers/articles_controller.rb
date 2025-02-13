class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  #puxando todos os artigos do banco de dados
  end
end
