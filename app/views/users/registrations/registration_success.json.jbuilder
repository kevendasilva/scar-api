json.message "Signed up successfully."
json.data do
  json.extract! @user, :id, :name, :email
end
