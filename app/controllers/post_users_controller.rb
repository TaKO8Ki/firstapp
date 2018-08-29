class PostUsersController < ApplicationController

    def index
        if params[:user]
            @post =  Post.user_with(params[:user])
        end
    end

end
