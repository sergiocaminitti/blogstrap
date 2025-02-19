class ArticlesController < ApplicationController
  # executando antes de ações // only define antes de quais def's ele vai executar
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    # pegando os três artigos mais recentes
    @highlights = Article.desc_order.first(3)
    current_page = (params[:page] || 1).to_i
    highlight_ids = @highlights.pluck(:id).join(',')
    @articles = Article.without_highlights(highlight_ids)
                      .desc_order
                      .page(current_page)
  end
  def show
  end
  def new
    @article = current_user.articles.new
  end
  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new
    end
  end

  def edit
  end
  # def edit; end -- outra forma de escrever o método edit

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit
    end

  end

  def destroy
    @article.destroy

    redirect_to root_path, notice: "Article was successfully destroyed."
  end

  private

  def set_article
    # atribuindo para article o artigo que tem o id igual ao id passado na url
    @article = Article.find(params[:id])
    # joga o usuário que está criando o artigo, e o artigo e salva nas variáveis
    # user e record do initialize application_policy, assim esse artigo terá o regitro de
    # seu autor quardado em user
    authorize @article
  end

  # strong parameters para permitir que os parametros sejam passados para o model
  def article_params
    # definindo que os parametros permitidos são title e body
    params.require(:article).permit(:title, :body, :category_id)
  end
end
