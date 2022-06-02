# frozen_string_literal: true

module Campus
  class PostController < ApplicationController
    def index
      @posts = Campus::Post.all.order(created_at: :desc)
      @post = Campus::Post.new
    end

    def create
      Campus::Post.create(post_params)
      redirect_to posts_path
    end

    def like
      Campus::Post.find_by(id: params[:post_id]).increment!(:likes_count)
      ActionCable.server.broadcast(
        "CampusPostsChannel",
        Campus::Post.all.order(created_at: :desc)
      )
      redirect_to posts_path
    end

    private

    def post_params
      params.require(:post).permit(:raw_body)
    end
  end
end
