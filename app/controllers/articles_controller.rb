class ArticlesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments

    @comment = @article.comments.build

  end

  def new
  end

  def create
    @user = User.find_by(id: current_user.id)
    @article = @user.articles.new(article_params)
   
    if @article.valid?
      @article.save
      redirect_to @user.articles.last
    else
      render action: "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if  @article.user_id == current_user.id 
      if @article.update(article_params)
        redirect_to @article
      else
        render action: "edit"
      end
    else
      @message = "You can't edit someone else's articles!"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = 'Article destroied successfully'
      redirect_to articles_path
    end
  end


  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
