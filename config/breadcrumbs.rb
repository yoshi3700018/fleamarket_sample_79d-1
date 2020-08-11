crumb :root do
  link "ホーム", root_path
end

# ホーム > マイページ
crumb :mypage do
  link "#{current_user.nickname}のマイページ", user_path
  parent :root
end
# ホーム > マイページ > XXXXX
crumb :profile do
  link "プロフィール編集" , profile_user_path
  parent :mypage
  end

crumb :logout do
  link "ログアウト" , logout_user_path
  parent :mypage
end

crumb :new_product do
  link "出品する", new_product_path
  parent :mypage
end

# ホーム > カテゴリーLEVEL 1
# ホーム > カテゴリーLEVEL 2
# ホーム > カテゴリーLEVEL 3
