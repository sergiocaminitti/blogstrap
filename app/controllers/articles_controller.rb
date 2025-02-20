class ArticlesController < ApplicationController
  include Paginable

  # executando antes de ações // only define antes de quais def's ele vai executar
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @categories = Category.sorted

    category = @categories.find_by_name(params[:category]) if params[:category].present?

    if category
      # Carregar os destaques com eager loading de :category e :user
      @highlights = Article.includes(:category, :user)
                            .filter_by_category(category)
                            .desc_order
                            .first(3)

      highlight_ids = @highlights.pluck(:id).join(',')

      # Carregar os artigos com eager loading de :category e :user
      @articles = Article.includes(:category, :user)
                          .without_highlights(highlight_ids)
                          .filter_by_category(category)
                          .desc_order
                          .page(current_page)
    else
      # Carregar os destaques sem categoria com eager loading de :category e :user
      @highlights = Article.includes(:category, :user)
                            .desc_order
                            .first(3)

      highlight_ids = @highlights.pluck(:id).join(',')

      # Carregar os artigos sem categoria com eager loading de :category e :user
      @articles = Article.includes(:category, :user)
                          .without_highlights(highlight_ids)
                          .desc_order
                          .page(current_page)
    end
  end

  def show;  end

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
  def edit; end

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
