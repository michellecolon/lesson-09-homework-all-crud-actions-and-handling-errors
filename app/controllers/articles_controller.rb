class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    #puts params
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
    
  def create
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = "Article was successfully created!"
      redirect_to article_path(@article)
    else
      flash.now[:error] = "An error occurred while saving your article. Please try again."
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Article was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating your article"
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
