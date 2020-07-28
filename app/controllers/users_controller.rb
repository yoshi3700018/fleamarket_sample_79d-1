class UsersController < ApplicationController
  # デバイスで処理できない登録部分などをまとめていく

  # 他テーブルとの兼ね合いもあり、ルーティングとアソシエーションネスト完成後に有効にしていく
  # before_action :set_user, only: [:show, :edit, :profile, :profile_update, :logout]
  # before_action :set_address, only: [:edit, :update]

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


end
