FactoryBot.define do
  factory :comment do
    content { "Nice comment!" }
    commentable { association :post }  # You can change this to image or post
  end
end
