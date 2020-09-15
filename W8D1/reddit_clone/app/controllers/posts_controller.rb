class PostsController < ApplicationController


    def new
        @post = Post.new
        @post.sub_id = params[:sub_id]
        render :new
    end

    # Approach1: we can only use post_url(id) here in the controller
    # Approach2: assuming we can call post_url(id) anywhere, have some kidn of post-creation hook
    # in model

    def create
        @post = Post.new(posts_params)
        @post.sub_id = params[:sub_id]
        if @post.save
            @post.url = post_url(@post.id)
            redirect_to post_url(@post.id)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
    end

    def destroy
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    private
    def posts_params
        params.require(:post).permit(:title, :author_id, :content)
    end
end
