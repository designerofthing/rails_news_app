class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)

    if @article.persisted? && @article.title != '' && @article.content != ''
      redirect_to @article
      flash[:notice] = 'Article was successfully created.'
    else
      flash[:notice] = 'Whoops, something went wrong'
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
      flash[:notice] = 'Article was successfully saved.'
    else
      flash[:notice] = 'Whoops, something went wrong'
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = 'Article was successfully deleted.'
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end