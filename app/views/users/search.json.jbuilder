json.users @users do |user|
  json.name user.name
  json.id user.id
end

json.ideas @ideas do |idea|
  json.title idea.title
  json.id idea.id
end
