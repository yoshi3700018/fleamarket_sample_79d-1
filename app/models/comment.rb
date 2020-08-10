class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, presence: true, length: { in:1..120}
end

# = form_with(model: [@item, @comment], local: true, id: "new-comment") do |form|
#   = form.text_area :comment, class: "textbox",placeholder: "コメントは120文字まで入力できます。"
#   = button_tag type: 'submit', class: "comment-btn"do
#     %i.fa.fa-comment コメントする
#   %p.comment-notice 
#     相手のことを考え丁寧なコメントを心がけましょう。
#     %br
#     不快な言葉遣いなどは利用制限や退会処分となることがあります。
