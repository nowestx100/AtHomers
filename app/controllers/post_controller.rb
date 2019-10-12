class PostController < ApplicationController

    def new
    end

    def create
        @post=Post.new(content:params[:content],
                       user_id:session[:user_id],)
        @post.save
        redirect_to ("/home")
    end
end
