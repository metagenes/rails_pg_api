class Api::V1::UsersController < ApplicationController

    # GET /check
    def check
        render json: { message: 'ok', status:200 }, status: 200
    end

    # GET /users
    def index
        @users = User.all
        render json: @users
    end

    # GET /users/:id
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    # POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render error: { error: 'failed to create data user' }, status: 400
        end
    end

    # PUT /users/:id
    def update
        @user = User.find(params[:id])
        if @user
            @user.update(User_params)
            render json: { message: 'data user updated' }, status: 200
        else
            render error: { error: 'failed to update data user' }, status: 400
        end
    end

    # DELETE /users/:id
    def destroy
        @user = User.find(params[:id])
        if @user
            @user.destroy
            render json: { message: 'data user deleted' }, status: 200
        else
            render error: { error: 'failed to delete data user' }, status: 400
        end
    end

    def user_params
        params.require(:user).permit(:name, :password)
    end

    
end
