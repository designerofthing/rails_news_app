class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(params.require(:article).permit(:title, :content))

    if @article.persisted? && @article.title != '' && @article.content != ''
      redirect_to @article
      flash[:notice] = 'Article was successfully created.'
    else
      flash[:notice] = 'Whoops, something went wrong'
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
  
end