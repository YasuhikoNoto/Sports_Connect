class Admin::MembersController < ApplicationController
before_action :authenticate_admin!
  def index
    @members = Member.all.page(params[:page]).per(10).page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path
    else
      render :edit
    end
  end

  private

  def member_params
    params.require(:member).permit(:member_image, :name, :email, :phone_number, :is_deleted)
  end

end
