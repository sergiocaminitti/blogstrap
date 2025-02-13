class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    # puxando todos os artigos do banco de dados
  end
  def show
    @article = Article.find(params[:id])
    # atribuindo para article o artigo que tem o id igual ao id passado na url
  end

end
