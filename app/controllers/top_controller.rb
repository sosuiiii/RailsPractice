class TopController < ApplicationController
before_action :authenticate_user, {only: [:index]}
  def index
    @jobs = Job.all.order(created_at: :desc)
    @manager = 1

  end

  def new
  end

  def cancel
    @job = Job.find_by(id: params[:id])
    @job.user_id = 1
    if @job.save

      flash[:notice] = "キャンセルが完了しました"
      redirect_to("/jobs/index")
    else
      flash[:error] = "キャンセルに失敗しました"
      render("jobs/index")
    end
  end

  def about
  end

  def destroy
    @job = Job.find_by(id: params[:id])
    @job.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/jobs/index")
  end


  def create
    job = Job.new(content: params[:content],user_id: session[:user_id])
    job.save
    flash[:notice] ="ジョブの登録を完了しました"
    redirect_to("/jobs/index")

  end

  def practice
    
  end

  def join
    @job = Job.find_by(id: params[:id])
    @job.user_id = session[:user_id]
    if @job.save
      flash[:notice] = "応募が完了しました"
      redirect_to("/jobs/index")
    else
      flash[:error] = "応募に失敗しました"
      render("jobs/index")
    end

  end

end
