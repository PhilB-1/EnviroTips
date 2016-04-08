def user_exist?(email)
  begin
    return true if User.find_by(email: email)
  rescue
    return false
  end
end