class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  #ストロングパラメーターの基本構文
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
  
  #ストロングパラメータは、Web上から受けたつけたパラメータが、
  #本当に安全なデータかどうかを検証した上で、取得するための仕組み

end
