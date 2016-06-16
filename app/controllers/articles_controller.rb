class ArticlesController < ApplicationController

include ApplicationHelper


  def new
    @article = Article.new
    @section = Section.new
    @group = Group.find(params[:group_id])
    @article.writer_id = current_user.id
    @article.group_id = @group.id
    @article.sections << @section
  end

  def create
    @article = Article.new(article_params)
    @group = Group.find(params[:group_id])
    @article.writer_id = current_user.id
    @article.group_id = @group.id
    if @article.save
       render '/articles/show'
    else
      @errors = @article.errors.full_messages
      redirect_to @group
    end
  end

  def show
    @tag = Tag.new
    @article = Article.find_by(id: params[:id])
    @tags = @article.tags
    @user = @article.writer.username
    # @favorite = @article.favorites.find_by(user_id: current_user.id, article_id: params[:favorite][:article_id])
    @group = Group.find_by(id: params[:group_id])

    if @article
      render '/articles/show'
    else
      redirect_to @group
    end
  end

  def edit
    @article = Article.find_by(id: params[:id])
    @article.update(product_params)
  end

  def destroy
  end

  private
    def article_params
      params.require(:article).permit(:title, :bibliography)
    end

    def section_params
      params.require(:article).permit(:title, :bibliography, section_attributes: [:subtitle, :body])
    end

end
