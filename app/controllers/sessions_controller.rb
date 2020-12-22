class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.login(params[:user])
    if user
      # 發號碼牌
      session[:user9527] = user.id
      redirect_to root_path, notice: '登入成功!'
    else
      redirect_to sign_in_users_path, notice: '登入失敗!'
    end
  end

  def destroy
    session[:user9527] = nil
    redirect_to root_path, notice: '已登出!'
  end
end
