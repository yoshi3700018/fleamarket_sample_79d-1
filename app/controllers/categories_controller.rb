class CategoriesController < ApplicationController
  before_action :set_category, only: [:index, :show]
  def index
    @parents = Category.where(ancestry: nil )
    @products = Product.all
  end

  def show
    @category = Category.find(params[:id])
    @product = Product.where(:ancestry_id == @category.id)

  end
  
  # ヘッダーに必要な要素でほぼ全ページに必要なことから、application_controllerへ移行させました。
  # ヘッダーを調整する時に注意
  
  # # デフォルトで設定するセレクトドロップダウンリストに入れる値(親要素の値)を定義
  # def set_category
  #   @category_level1 = Category.where(ancestry: nil)
  # end
  # # 子供のカテゴリーを設定、親の名称で検索 => 紐づいた配列を取得
  # # コントロール自体はJSONで行う
  # def set_category_level2
  #   @category_level2 = Category.find(params[:level1_id]).children
  # end
  # # 孫のカテゴリーを設定
  # def set_category_level3
  #   @category_level3 = Category.find("#{params[:level2_id]}").children
  # end
  
end