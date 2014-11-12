Warden::Strategies.add(:password) do
  def valid?
    params["email"] && params["password"]
  end

  def authenticate!
    u = User.authenticate(params["email"], params["password"])
    u.nil? ? fail! : success!(u)
  end
end
