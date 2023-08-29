class Public::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
    unless @member.id == current_member.id
      redirect_to member_path(current_member)
    end
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to member_path
    else
      render :edit
    end
  end

  def confirm
    @member = current_member
  end

  def leave
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    flash[:left] = "退会しました"
    redirect_to root_path
  end

  private

  def member_params
    params.require(:member).permit(:member_image, :name, :email, :phone_number)
  end

end
