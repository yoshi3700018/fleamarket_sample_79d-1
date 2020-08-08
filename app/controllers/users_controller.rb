class UsersController < ApplicationController
  # デバイスで処理できない登録部分などをまとめていく
  before_action :set_user, only: [:show, :edit, :profile, :profile_update, :logout]
  # ユーザー情報登録画面作成時に
  # before_action :set_address, only: [:edit, :update]

  
  def building_construction
  end

  def show 
  end

  def edit
  end

  # def update
  #   if @address.update(address_params)
  #     redirect_to edit_user_path(@address)
  #   else
  #     render :edit
  #   end
  # end

  # サインアップのセッションで情報を入力する段階を踏むprofileと編集用のupdateを定義します
  def profile
  end

  def profile_update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :profile
    end
  end

  def logout
  end

  private
  def address_params
    params.require(:address).permit(:postal_code,
                                    :prefecture,
                                    :city,
                                    :address_line,
                                    :apartment
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  
end
