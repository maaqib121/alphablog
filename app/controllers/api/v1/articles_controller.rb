module Api
  module V1
    class ArticlesController < ApiController
      def index
        @articles = Article.all
        render json: ArticleSerializer.new(@articles).serializable_hash
      end

      def create
        @article = Article.new(article_params)
        @article.user = User.first()
        if @article.save
          render json: @article, status: :created
        else
          render json: { error: @article.errors.messages }
        end
      end

      private

      def article_params
        params.require(:article).permit(:title, :description, category_ids: [])
      end
    end
  end
end
