json.message 'Logged in successfully.'
json.data do
  json.extract! @user, :id, :name, :email
end
