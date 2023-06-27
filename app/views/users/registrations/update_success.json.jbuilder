json.message "Successfully updated."
json.data do
  json.extract! @user, :id, :name, :email
end
