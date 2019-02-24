class UserController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  # ログインが必要です。
  before_action :forbid_login_user, {only: [:new, :create, :login]}
  # すでにログインしています。
  before_action :ensure_correct_user, {only: [:edit, :update]}
  before_action :set_current_user

  def login
      @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] ="ログインしました"
      redirect_to("/jobs/index")

    else
      @error_message = "未入力項目があるか、メールアドレスまたはパスワードが間違っています"
      render("signup")
    end

   end


    def create

      @user = User.new(name: params[:name],email: params[:email],password: params[:password])
      if @user.save
        
        flash[:notice] = "ユーザー登録が完了しました。"
        redirect_to("/signup")
      else
         @error_message = "入力に間違いがあるか、使用されたメールアドレスです"
         render("user/new")
     end

     end

     def signup
     end

     def ensure_correct_user
       if @current_user.id != params[:id].to_i
       flash[:notice] = "権限がありません"
       redirect_to("/jobs/index")
       end
     end

     def logout
       session[:user_id] = nil
       flash[:notice] = "ログアウトしました"
       redirect_to("/signup")
     end

     def myPage
       @user = User.find_by(id: session[:user_id])
     end


end
