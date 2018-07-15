class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def edit
        @post = Post.new
    end

    def update
        @post = Post.new(post_params)
        if @post.update(post_params)
            redirect_to posts_path, notice: 'Post was updated'
        else
            render :new
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            redirect_to posts_path, notice: 'Post was deleted'
        else
            redirect_to posts_path, alert: 'There was an error, try again'
        end
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path, notice: 'Post was created'
        else
            render :new
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :author_id)
    end
end