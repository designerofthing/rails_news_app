class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(params.require(:article).permit(:title, :content))

    if @article.persisted?
    redirect_to @article, notice: "Article was created"
    else
             
    end
  end

  def show
      @article = Article.find(params[:id])
  end
  
end
