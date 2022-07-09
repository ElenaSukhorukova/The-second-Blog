class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
    render :index
  end

  def show
    @art = Article.find(id: params[:id])
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    
    if @article.valid?
      @article.save
    else
      render action: "new"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
