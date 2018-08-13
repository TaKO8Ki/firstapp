class ArticlesController < ApplicationController
    before_action :set_ranking

    def show
        @article = Post.find(params[:id])
        REDIS.zincrby "articles/daily/#{Date.today.to_s}", 1, "#{@article.id}"
    end

    def set_ranking_data
        ids = REDIS.zrevrangebyscore "articles/daily/#{Date.today.to_s}", "+inf", 0, limit: [0, 5]
        @ranking_articles = Post.where(id: ids)

        if @ranking_articles.count < 5
            adding_articles = Post.order(created_at: :DESC, updated_at: :DESC).where.not(id: ids).limit(5 - @ranking_articles.count)
            @ranking_articles.concat(adding_articles)
        end
    end
end
