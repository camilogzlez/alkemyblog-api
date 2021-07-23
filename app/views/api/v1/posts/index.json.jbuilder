json.array! @posts do |post|
  json.extract! post, :id, :title, :content, :image, :category
end
