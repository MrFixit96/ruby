class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end #END METHOD

  def show
    @article = Article.find(params[:id])
  end #END METHOD

  def new
    @article = Article.new
  end #END METHOD

  def edit
    @article = Article.find(params[:id])
  end #ENDMETHOD

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end #ENDif

  end #ENDMETHOD

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end #ENDif

  end #ENDMETHOD


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end #ENDMETHOD

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end #END METHOD

end #ENDCLASS

