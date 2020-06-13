class UsersController < ApplicationController

    #ユーザー一覧
    def index
        @users = User.all
    end
    
    #ユーザーページ
    def show 
        @user = User.find(params[:id])
        @articles = Article.where(user_id: @user.id)
    end

    #ユーザー編集
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        redirect_to("user/show/:id")
    end




end
