class ArticlesController < ApplicationController

  def new
    @article =Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    #@tags = Tag.new(tag_params)
    if @article.save
      tag_list = tag_params[:tags].delete(" ").split(",")
      # article.rb に save_tags()メソッドを定義
      @article.save_tags(tag_list)
      redirect_to(root_path)
    else
      redirect_to (article_new_path)
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    info = ArticleTagRelation.where(article_id: @article.id)
    @tags =[]
    for tag in info do 
      @tags += Tag.find(tag.tag_id)
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(title: params[:title])
    redirect_to('article/:id/show')
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def tagSearch
    @article = Tag.find(params[:id]).articles
  end

  private

  def article_params
    params.require(:article).permit(:title,:body)
  end

  def tag_params
    params.require(:article).permit(:tags)
  end
end
