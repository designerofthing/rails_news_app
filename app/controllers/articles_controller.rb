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

  def edit
    @article = Article.find(params[:title])
  end

  def show
    @article = Article.find(params[:id])
  end
end
