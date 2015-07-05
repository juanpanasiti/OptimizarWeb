class ArticlesController < ApplicationController
  #before_action :validate_user!, except: [:index,:show]
  before_action :set_article, except: [:index,:new, :create]
  before_action :authenticate_editor!, except: [:index,:show]
  before_action :authenticate_admin!, only: [:destroy]
  def index
  	@articles = Article.paginate(page: params[:page],per_page:5).publishable.latest
  end

  def show
  	@article.update_visitsCount
    @comment = Comment.new()
    #@article = Article.article_html

  end

  def new
  	@article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.categories = params[:categories]
  	if @article.valid?
  		@article.save
  		redirect_to @article
  	else
  		render :new
  	end
  end

  def edit
    
  end
  def update
  	
  end

  def destroy
  	@article.destroy
  	redirect_to articles_path
  end

  private
  def article_params
  	params.require(:article).permit(:title,:body,:published,:author,:categories,:markup_body)
  end
  def set_article
    @article = Article.find(params[:id])
  end
end