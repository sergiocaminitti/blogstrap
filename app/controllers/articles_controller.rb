class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    # puxando todos os artigos do banco de dados
  end
  def show
    @article = Article.find(params[:id])
    # atribuindo para article o artigo que tem o id igual ao id passado na url
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    # puxando o artigo que tem o id igual ao id passado na url
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  private
  # strong parameters para permitir que os parametros sejam passados para o model
  def article_params
    # definindo que os parametros permitidos são title e body
    params.require(:article).permit(:title, :body)
  end
end
